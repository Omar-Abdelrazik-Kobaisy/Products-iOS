//
//  Base.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation

public typealias Parameters = [String:Any]
public typealias Headers    = [String:String]
public typealias QueryBody  = [String:Any]


public enum HTTPMethod: String{
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

