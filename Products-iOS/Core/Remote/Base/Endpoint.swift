//
//  Endpoint.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation

protocol Endpoint{
    var path: String {get}
    var requestTimeOut: Int {get}
    var httpMethod: HTTPMethod {get}
}

extension Endpoint{
    var requestTimeOut: Int{
        30
    }
}

protocol RequestEndpoint: Endpoint{
    var parameters: Parameters? {get}
    func createRequest() -> NetworkRequest
}
