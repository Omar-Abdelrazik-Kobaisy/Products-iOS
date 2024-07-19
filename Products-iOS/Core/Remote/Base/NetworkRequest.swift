//
//  NetworkRequest.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation

public struct NetworkRequest {
    var path: String
    var parameters: Parameters?
    var headers: [String: String]
    var requestBody: Any?
    var requestTimeOut: Float?
    var httpMethod: HTTPMethod
    
    var queryItems: [URLQueryItem]?{
        parameters?.map({URLQueryItem(name: $0.key, value: "\($0.value)")})
    }
    
    var httpBody: Data?{
        if let requestBody = self.requestBody as? [String: Any]{
            return try? JSONSerialization.data(withJSONObject: requestBody)
        }
        return nil
    }
    
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = BaseDomain.production.rawValue
        components.path = path
        components.queryItems = queryItems
        return components.url!
    }
    
    var urlDiscription: String{
        url.absoluteString
    }
    
    public init(path: String,
                parameters: Parameters? = nil,
                requestBody: Any? = nil,
                requestTimeOut: Float? = nil,
                httpMethod: HTTPMethod) {
        self.path = path
        self.parameters = parameters
        self.headers = ["Content-Type": "application/json"]
        self.requestBody = requestBody
        self.requestTimeOut = requestTimeOut
        self.httpMethod = httpMethod
    }
    public func buildURLRequest(with url: URL) -> URLRequest{
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody
        return urlRequest
    }
}
