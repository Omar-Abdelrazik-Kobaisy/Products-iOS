//
//  ProductsViewModel.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import Foundation
import oAmNetworking

final class ProductsViewModel: BaseObservableViewModel{
    @Published private(set) var products = Array<ProductModel>()
    @Published var searchProductName: String = ""
    var fetchedProducts = Array<ProductModel>()
    
    //MARK: Service
    private let productsService: ProductsServiceProtocol
    
    init(productsService: ProductsServiceProtocol){
        self.productsService = productsService
        super.init()
        fetchProducts()
        searchForProduct()
    }
    
}

extension ProductsViewModel{
    func searchForProduct(){
        $searchProductName
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink(receiveValue: {[weak self] searchText in
                print(searchText)
                guard let self else{return}
                let filteredProducts = self.fetchedProducts.filter({
                    $0.title.contains(searchText)
                    })
                self.products = filteredProducts
                if searchText.isEmpty{
                    self.fetchProducts()
                }
            })
            .store(in: &cancellables)
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
        fetchedProducts = productList
        isLoading = false
    }
}
