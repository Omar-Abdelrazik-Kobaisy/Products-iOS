//
//  ProductModel.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation

// MARK: - ProductModel
struct ProductModel: Codable, Identifiable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand, sku: String?
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation, availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
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
