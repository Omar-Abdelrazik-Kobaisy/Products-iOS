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
                    .frame(maxWidth:.infinity,minHeight: 0,maxHeight: 350)
            } placeholder: {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:.infinity,minHeight: 0,maxHeight: 350)
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "heart.circle.fill")
                        .foregroundStyle(.white, .blue)
                        .font(.system(size: 25))
                        .shadow(radius: 10)
                        .padding()
                }

            }
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                    .minimumScaleFactor(0.7)
                Text(product.description)
                    .lineLimit(2)
                HStack(spacing: 5){
                    Text("EGP \(product.priceAfterDiscount.toCurrencyFormate2())")
                    Text("\(product.price.toCurrencyFormate2()) EGP")
                        .strikethrough(true, color: .blue)
                        .foregroundColor(.blue)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,2)
                HStack{
                    Text("Review (\(product.rating.asNumberString()))⭐️")
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Button {
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 25))
                    }
                    
                }
            }
            .padding([.horizontal,.vertical],5)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue.opacity(0.8),lineWidth: 4)
        }
        .background()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
        .frame(height: 350)
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: dev.fetchProducts().first!)
    }
}
