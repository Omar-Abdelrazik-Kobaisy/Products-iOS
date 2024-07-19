//
//  Requestable.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import Combine

public protocol Requestable{
    var defaultRequestTimeOut: Float {get}
    func fetchRequest<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError>
}

public final class NetworkRequestable: Requestable{
    public var defaultRequestTimeOut: Float
    
    
    init(){
        defaultRequestTimeOut = 30.0
    }
    
    public func fetchRequest<T>(_ request: NetworkRequest) -> AnyPublisher<T, NetworkError> where T : Decodable, T : Encodable {
        #if DEBUG
        print("🚀",
              request.httpMethod.rawValue,
              request.urlDiscription,
              request.headers,
              request.parameters != nil ? "🔐 \(request.parameters!)" : "",
              request.requestBody as? [String: Any] as Any)
        #endif
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(request.requestTimeOut ?? defaultRequestTimeOut)
        
        guard let url = URL(string: request.urlDiscription) else {
            print("bad URL")
            return AnyPublisher(Fail<T,NetworkError>(error: .badURL("invalid URL")))
        }
        
        
        return URLSession.shared
            .dataTaskPublisher(for: request.buildURLRequest(with: url))
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    print("server Error 🔥")
                    throw NetworkError.invalidResponse
                }
                print("📶 \(response.debugDescription)")
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError(errorHandling(_:))
            .print()
            .eraseToAnyPublisher()
    }
    
    private func errorHandling(_ error: Error) -> NetworkError{
        let networkError = error as? NetworkError
        switch networkError {
        case .badURL(let error):
            return .badURL("\(error) bad URL")
        case .serverError(let code, let error):
            return .serverError(code: code, error: "server Error \(error)")
        case .invalidResponse:
            return .invalidResponse
        default:
            print(error.localizedDescription)
            return NetworkError.unKnowon(error.localizedDescription)
        }
    }
}
