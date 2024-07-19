//
//  BaseResponse.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
struct BaseResponse<T: Codable>: Codable{
    let data: T?
    let total: Int
    let skip: Int
    let limit: Int
    
    enum CodingKeys:String, CodingKey{
        case data = "products"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }
}
