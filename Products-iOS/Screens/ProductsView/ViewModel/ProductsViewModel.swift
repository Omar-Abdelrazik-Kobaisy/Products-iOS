//
//  ProductsViewModel.swift
//  Products-iOS
//
//  Created by Omar on 20/07/2024.
//

import Foundation
import oAmNetworking
import PersistentLayer

final class ProductsViewModel: BaseObservableViewModel{
    @Published private(set) var products = Array<ProductModel>()
    @Published var searchProductName: String = ""
    var fetchedProducts = Array<ProductModel>()
    
    //MARK: Service
    private let productsService: ProductsServiceProtocol
    private let provider = CoreDataProvider.shared
    private let coreDataService: CoreDataServices<ProductEntity>
    
    init(productsService: ProductsServiceProtocol){
        self.productsService = productsService
        self.coreDataService = CoreDataServices<ProductEntity>(context: provider.backgroundContext)
        super.init()
//        fetchProducts()
        fetchAllProductsFromCoreData()
        searchForProduct()
    }
    
}

extension ProductsViewModel{
    func searchForProduct(){
        $searchProductName
            .dropFirst(2)
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
    private func fetchProducts(){
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
        for producut in productList {
            do{
                try coreDataService.create(producut.toEntity(context: provider.backgroundContext))
            }catch{
                print(error as! CoreDataError)
            }
        }
        isLoading = false
    }
}

extension ProductsViewModel{
    func fetchAllProductsFromCoreData(){
        do{
            let productsEntities = try coreDataService.readAll()
            for productEntity in productsEntities{
                products.append(ProductModel(entity: productEntity))
            }
        }catch{
            print(error as! CoreDataError)
        }
        
    }
}
