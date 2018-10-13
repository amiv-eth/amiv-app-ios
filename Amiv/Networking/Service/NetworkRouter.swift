//
//  NetworkRouter.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public typealias NetworkRouterRequestCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

public typealias NetworkRouterDownloadCompletion = (_ url: URL?, _ response: URLResponse?, _ error: Error?) -> Void

public protocol NetworkRouter: class {
    
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint, completion: @escaping NetworkRouterRequestCompletion)
    
    func download(_ route: EndPoint, completion: @escaping NetworkRouterDownloadCompletion)
    
}
