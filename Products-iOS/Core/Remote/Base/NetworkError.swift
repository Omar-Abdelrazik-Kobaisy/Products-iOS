//
//  NetworkError.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation

public enum NetworkError: Error{
    case badURL(_ error: String)
    case serverError(code: Int, error: String)
    case invalidResponse
    case unKnowon(_ error: String)
}
