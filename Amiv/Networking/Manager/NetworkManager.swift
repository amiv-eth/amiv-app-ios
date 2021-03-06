//
//  NetworkManager.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct NetworkManager<EndPoint: EndPointType> {
    
    private let router = Router<EndPoint>()
    
    public enum NetworkResponse: String {
        case success
        case authenticationError = "You are not logged in"
        case badRequest = "Bad request"
        case failed = "Request failed"
        case noData = "Request was without data to decode."
        case unableToDecode = "Unable to decode data."
        case serverError = "Something went wrong at the AMIV server."
        case alreadyExists = "Entry already exists."
    }
    
    public enum RequestResult<String> {
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkRequest(_ response: HTTPURLResponse) -> RequestResult<String> {
        switch response.statusCode {
        case 200...299, 100:
            return .success
        case 400:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 401:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 404:
            return .failure(NetworkResponse.noData.rawValue)
        case 422:
            return .failure(NetworkResponse.alreadyExists.rawValue)
        case 500:
            return .failure(NetworkResponse.serverError.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
}

extension NetworkManager where EndPoint == AMIVApiEvents {
    
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
    
    public func getImage(for path: String, _ completion: @escaping (_ image: Data?, _ error: String?) -> Void) {
        router.request(.media(path)) { (data, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                completion(responseData, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getAllEventSignups(_ completion: @escaping (_ signups: [EventSignup]?, _ error: String?) -> Void) {
        router.request(.allEventSignups) { (data, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                do {
                    let json = try JSONDecoder().decode(EventsSignupResponse.self, from: responseData)
                    completion(json.eventSignups, nil)
                } catch {
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func signupTo(_ event: String, _ completion: @escaping (_ signup: EventSignup?, _ error: String?) -> Void) {
        guard let user = SessionManager.userID else {
            completion(nil, "Missing user id")
            return
        }
        router.request(.signup(event, user: user)) { (data, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                debugPrint("fail")
                return
            }
            
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let data = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                do {
                    let json = try JSONDecoder().decode(EventSignup.self, from: data)
                    completion(json, nil)
                } catch {
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}

extension NetworkManager where EndPoint == AMIVApiJobs {
    
    public func getJobOffers(_ completion: @escaping (_ response: JobOffersResponse?, _ error: String?) -> Void) {
        router.request(.jobs) { (data, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                do {
                    let apiResponse = try JSONDecoder().decode(JobOffersResponse.self, from: responseData)
                    completion(apiResponse, nil)
                } catch {
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getMedia(for path: String, named: String, _ completion: @escaping (_ url: URL?, _ error: String?) -> Void) {
        router.download(.media(path), named) { (url, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let url = url else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                completion(url, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getImage(for path: String, _ completion: @escaping (_ image: Data?, _ error: String?) -> Void) {
        router.request(.media(path)) { (data, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                completion(responseData, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}

extension NetworkManager where EndPoint == AMIVApiStudyDocuments {
    
    public func getStudyDocuments(_ completion: @escaping (_ response: [StudyDocument]?, _ error: String?) -> Void) {
        router.request(.overview) { (data, response, error) in
            guard error == nil else {
                completion(nil, error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            let result = self.handleNetworkRequest(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                do {
                    let apiResponse = try JSONDecoder().decode(StudyDocumentResponse.self, from: responseData)
                    completion(apiResponse._items, nil)
                } catch {
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}

extension NetworkManager where EndPoint == AMIVApiSession {
    
    public func authenticate(username: String, password: String, _ completion: @escaping (_ response: AuthenticationResponse?, _ error: String?) -> Void) {
        router.request(.authenticate(username: username, password: password)) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode(AuthenticationResponse.self, from: responseData)
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
    
    public func logout(_ completion: @escaping (_ success: Bool, _ error: String?) -> Void) {
        guard let sessionID = SessionManager.sessionID, let etag = SessionManager.etag else {
            completion(false, "Missing sessionID or etag")
            return
        }
        router.request(.logout(sessionID, etag)) { (data, response, error) in
            guard error == nil else {
                completion(true, nil)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkRequest(response)
                switch result {
                case .success:
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
            }
        }
    }
    
}

extension NetworkManager where EndPoint == AMIVApiUser {
    
    public func getAllUsers(_ completion: @escaping (_ response: [User]?, _ error: String?) -> Void) {
        router.request(.allUsers) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode(UsersResponse.self, from: responseData)
                        completion(apiResponse.users, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let error):
                    completion(nil, error)
                }
            }
        }
    }
    
    public func getUserInfo(userID: String, _ completion: @escaping (_ response: User?, _ error: String?) -> Void) {
        router.request(.userInfo(userID)) { (data, response, error) in
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
                        let apiResponse = try JSONDecoder().decode(User.self, from: responseData)
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
