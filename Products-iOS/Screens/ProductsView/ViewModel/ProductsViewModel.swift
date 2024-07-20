//
//  ProductsViewModel.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import Foundation

final class ProductsViewModel: BaseObservableViewModel{
    @Published private(set) var products = Array<ProductModel>()
    
    //MARK: Service
    private let productsService: ProductsServiceProtocol
    
    init(productsService: ProductsServiceProtocol){
        self.productsService = productsService
        super.init()
        fetchProducts()
    }
    
}

extension ProductsViewModel{
    func fetchProducts(){
        isLoading = true
        productsService.fetchProducts()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: onReceive(_:), receiveValue: onReceiveProducts(_:))
            .store(in: &cancellables)
    }
    private func onReceiveProducts(_ response: BaseResponse<Array<ProductModel>>){
        guard let productList = response.data else{
            errorMessage = "error while fetching products"
            isLoading = false
            return
        }
        products = productList
        isLoading = false
    }
}
