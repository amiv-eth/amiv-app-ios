//
//  Router.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public class Router<EndPoint: EndPointType>: NetworkRouter {
    
    private var tasks: [URLSessionTask] = []
    
    public func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
            self.tasks.append(task)
            task.resume()
        } catch let error {
            completion(nil, nil, error)
        }
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            if route.isAuthenticationRequired {
                try self.addAuthentication(&request)
            }
            
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameter, let urlParameter):
                try self.configureParameters(bodyParameters: bodyParameter, urlParameters: urlParameter, request: &request)
            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            }
            
            return request
        } catch let error {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch let error {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else {
            return
        }
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    fileprivate func addAuthentication(_ request: inout URLRequest) throws {
        guard let token = KeychainKey.authToken.getString() else {
            throw RouterError.missingAuthToken
        }
        
        guard let tokenData = String(format: "%@:", token).data(using: .utf8) else {
            throw RouterError.badAuthenticationData
        }
        
        let encodedAuthentication = tokenData.base64EncodedString()
        request.setValue("Basic \(encodedAuthentication)", forHTTPHeaderField: "Authorization")
    }
    
}
