//
//  ProductsEndpoint.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import oAmNetworking
enum ProductsEndpoint: RequestEndpoint{
    case getProducts
    
    var path: String{
        switch self {
        case .getProducts:
            return "/products"
        }
    }
    
    var httpMethod: HTTPMethod{
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var parameters: Parameters?{
        switch self {
        default:
            return nil
        }
    }
    
    func createRequest() -> NetworkRequest {
        NetworkRequest(path: path,
                       httpMethod: httpMethod)
    }
    
    
}
