//
//  ProductCard.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import SwiftUI

struct ProductCard: View {
    let product: ProductModel
    
    var body: some View {
        VStack {

            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "heart.circle.fill")
                        .foregroundStyle(.white, .blue)
                        .font(.system(size: 35))
                        .shadow(radius: 10)
                        .padding()
                }

            }
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text(product.description)
                    .lineLimit(2)
                    .padding(.bottom)
                HStack{
                    Text("EGP \(product.price)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text("Review (\(product.rating)) ⭐️")
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 35))
                    }
                    
                }
            }
            .padding()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue.opacity(0.8),lineWidth: 4)
        }
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding([.top,.horizontal])
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: dev.fetchProducts().first!)
    }
}
