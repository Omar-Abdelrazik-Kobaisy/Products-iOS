//
//  ProductModel.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import CoreData

// MARK: - ProductModel
struct ProductModel: Codable, Identifiable {
    let id: Int
    let title, description: String
//    let category: String
    let price, discountPercentage, rating: Double
//    let stock: Int
//    let tags: [String]
//    let brand, sku: String?
//    let weight: Int
//    let dimensions: Dimensions
//    let warrantyInformation, shippingInformation, availabilityStatus: String
//    let reviews: [Review]
//    let returnPolicy: String
//    let minimumOrderQuantity: Int
//    let meta: Meta
//    let images: [String]
    let thumbnail: String
    var priceAfterDiscount: Double{
            price - ((price * discountPercentage)/100)
    }
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt, barcode: String
    let qrCode: String
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment, date, reviewerName, reviewerEmail: String
}

extension ProductModel{
    // Convert from NSManagedObject to the plain model
        init(entity: ProductEntity) {
            self.id = Int(entity.id)
            self.title = entity.title ?? ""
            self.thumbnail = entity.thumbnail ?? ""
            self.price = entity.priceBefore
            self.discountPercentage = entity.discount
            self.rating = entity.rating
            self.description = entity.desc ?? ""
        }

        // Convert from the plain model to NSManagedObject
        func toEntity(context: NSManagedObjectContext) -> ProductEntity {
            let productEntity = ProductEntity(context: context)
            productEntity.id = Int32(self.id)
            productEntity.title = self.title
            productEntity.desc = self.description
            productEntity.priceBefore = self.price
            productEntity.discount = self.discountPercentage
            productEntity.rating = self.rating
            productEntity.thumbnail = self.thumbnail
            return productEntity
        }
}
