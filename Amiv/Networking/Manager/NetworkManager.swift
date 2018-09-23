//
//  NetworkManager.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct NetworkManager {
    
    private let router = Router<AMIVApi>()
    
    public enum NetworkResponse: String {
        case success
        case authenticationError = "You are not logged in."
        case badRequest = "Bad request"
        case failed = "Request railed"
        case noData = "Request was without data to decode."
        case unableToDecode = "Unable to decode data."
        case serverError = "Something went wrong at the AMIV server."
    }
    
    public enum RequestResult<String> {
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkRequest(_ response: HTTPURLResponse) -> RequestResult<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 400:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 401:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 404:
            return .failure(NetworkResponse.noData.rawValue)
        case 500:
            return .failure(NetworkResponse.serverError.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}

extension NetworkManager {
    
    public func getEvents(_ completion: @escaping (_ events: EventsResponse?, _ error: String?) -> Void) {
        router.request(.events) { (data, response, error) in
            guard error == nil else {
                completion(nil, "Please check your network connection.")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkRequest(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(EventsResponse.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
}
