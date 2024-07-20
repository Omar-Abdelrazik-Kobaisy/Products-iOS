//
//  ProductsView.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import SwiftUI

struct ProductsView: View {
    @StateObject private var viewModel: ProductsViewModel
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 8), count: 2)
    
    private var content: some View{VStack{
        SearchBarView(text: .constant(""))
            .padding(.bottom)
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, alignment: .center,spacing: 10) {
                ForEach(viewModel.products) { product in
                    ProductCard(product: product,
                                onAddToCartPressed: {
                        viewModel.successMessage = "Added Successfully"
                    })
                }
            }
        }
    }
    }
    var body: some View {
        BaseNavigationView {
            content
        }
    }
    init() {
        self._viewModel = StateObject(wrappedValue: ProductsViewModel(productsService: ProductsService()))
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
