//
//  Environment.swift
//  Products-iOS
//
//  Created by Omar on 03/08/2024.
//

import Foundation
import oAmNetworking
public enum BaseDomain: String{
    case production = "dummyjson.com"
}

extension Endpoint{
    var baseDomain: String{
        BaseDomain.production.rawValue
    }
}
