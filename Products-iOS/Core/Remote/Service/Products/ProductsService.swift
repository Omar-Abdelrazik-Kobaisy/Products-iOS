//
//  ProductsService.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import Combine

protocol ProductsServiceProtocol: RequestService{
    func fetchProducts() -> AnyPublisher<BaseResponse<Array<ProductModel>>,NetworkError>
}

final class ProductsService: ProductsServiceProtocol{
    var networkService: Requestable
    
    var fetchEndpoint: RequestEndpoint?
    
    init(networkService: Requestable = NetworkRequestable()){
        self.networkService = networkService
    }
    
    func fetchProducts() -> AnyPublisher<BaseResponse<Array<ProductModel>>, NetworkError> {
        fetchEndpoint = ProductsEndpoint.getProducts
        let request = fetchEndpoint!.createRequest()
        return networkService.fetchRequest(request)
    }
}
