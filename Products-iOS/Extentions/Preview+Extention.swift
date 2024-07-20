//
//  Preview+Extention.swift
//  Products-iOS
//
//  Created by Omar on 19/07/2024.
//

import Foundation
import SwiftUI
extension PreviewProvider{
    static var dev: DeveloperPreview{
        DeveloperPreview.instance
    }
}

class DeveloperPreview{
    static let instance = DeveloperPreview()
    private init(){}
    
    private let json =
        """
            [
            {
            "id": 4,
            "title": "Red Lipstick",
            "description": "The Red Lipstick is a classic and bold choice for adding a pop of color to your lips. With a creamy and pigmented formula, it provides a vibrant and long-lasting finish.",
            "category": "beauty",
            "price": 12.99,
            "discountPercentage": 19.03,
            "rating": 2.51,
            "stock": 68,
            "tags": [
            "beauty",
            "lipstick"
            ],
            "brand": "Chic Cosmetics",
            "sku": "O5IF1NTA",
            "weight": 5,
            "dimensions": {
            "width": 14.37,
            "height": 13.94,
            "depth": 14.6
            },
            "warrantyInformation": "Lifetime warranty",
            "shippingInformation": "Ships in 2 weeks",
            "availabilityStatus": "In Stock",
            "reviews": [
            {
            "rating": 5,
            "comment": "Great product!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Leo Rivera",
            "reviewerEmail": "leo.rivera@x.dummyjson.com"
            },
            {
            "rating": 4,
            "comment": "Very pleased!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Oscar Powers",
            "reviewerEmail": "oscar.powers@x.dummyjson.com"
            },
            {
            "rating": 5,
            "comment": "Very pleased!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Carter Rivera",
            "reviewerEmail": "carter.rivera@x.dummyjson.com"
            }
            ],
            "returnPolicy": "90 days return policy",
            "minimumOrderQuantity": 6,
            "meta": {
            "createdAt": "2024-05-23T08:56:21.619Z",
            "updatedAt": "2024-05-23T08:56:21.619Z",
            "barcode": "9444582199406",
            "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
            },
            "images": [
            "https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/1.png"
            ],
            "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/thumbnail.png"
            },
            {
            "id": 5,
            "title": "Red Nail Polish",
            "description": "The Red Nail Polish offers a rich and glossy red hue for vibrant and polished nails. With a quick-drying formula, it provides a salon-quality finish at home.",
            "category": "beauty",
            "price": 8.99,
            "discountPercentage": 2.46,
            "rating": 3.91,
            "stock": 71,
            "tags": [
            "beauty",
            "nail polish"
            ],
            "brand": "Nail Couture",
            "sku": "YUIIIP4W",
            "weight": 9,
            "dimensions": {
            "width": 8.11,
            "height": 10.89,
            "depth": 29.06
            },
            "warrantyInformation": "1 year warranty",
            "shippingInformation": "Ships in 1 week",
            "availabilityStatus": "In Stock",
            "reviews": [
            {
            "rating": 5,
            "comment": "Very pleased!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Leo Rivera",
            "reviewerEmail": "leo.rivera@x.dummyjson.com"
            },
            {
            "rating": 5,
            "comment": "Great product!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Evan Reed",
            "reviewerEmail": "evan.reed@x.dummyjson.com"
            },
            {
            "rating": 4,
            "comment": "Highly recommended!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Evelyn Sanchez",
            "reviewerEmail": "evelyn.sanchez@x.dummyjson.com"
            }
            ],
            "returnPolicy": "No return policy",
            "minimumOrderQuantity": 46,
            "meta": {
            "createdAt": "2024-05-23T08:56:21.619Z",
            "updatedAt": "2024-05-23T08:56:21.619Z",
            "barcode": "3212847902461",
            "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
            },
            "images": [
            "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/1.png"
            ],
            "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png"
            },
            {
            "id": 6,
            "title": "Calvin Klein CK One",
            "description": "CK One by Calvin Klein is a classic unisex fragrance, known for its fresh and clean scent. It's a versatile fragrance suitable for everyday wear.",
            "category": "fragrances",
            "price": 49.99,
            "discountPercentage": 0.32,
            "rating": 4.85,
            "stock": 17,
            "tags": [
            "fragrances",
            "perfumes"
            ],
            "brand": "Calvin Klein",
            "sku": "DZM2JQZE",
            "weight": 5,
            "dimensions": {
            "width": 11.53,
            "height": 14.44,
            "depth": 6.81
            },
            "warrantyInformation": "5 year warranty",
            "shippingInformation": "Ships overnight",
            "availabilityStatus": "In Stock",
            "reviews": [
            {
            "rating": 5,
            "comment": "Great value for money!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Sophia Brown",
            "reviewerEmail": "sophia.brown@x.dummyjson.com"
            },
            {
            "rating": 3,
            "comment": "Very disappointed!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Madison Collins",
            "reviewerEmail": "madison.collins@x.dummyjson.com"
            },
            {
            "rating": 1,
            "comment": "Poor quality!",
            "date": "2024-05-23T08:56:21.619Z",
            "reviewerName": "Maya Reed",
            "reviewerEmail": "maya.reed@x.dummyjson.com"
            }
            ],
            "returnPolicy": "No return policy",
            "minimumOrderQuantity": 20,
            "meta": {
            "createdAt": "2024-05-23T08:56:21.619Z",
            "updatedAt": "2024-05-23T08:56:21.619Z",
            "barcode": "2210136215089",
            "qrCode": "https://assets.dummyjson.com/public/qr-code.png"
            },
            "images": [
            "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/1.png",
            "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/2.png",
            "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/3.png"
            ],
            "thumbnail": "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png"
            }
            ]
        """
    func fetchProducts() -> [ProductModel] {
        let jsonData = json.data(using: .utf8)!
        let products: [ProductModel] = try! JSONDecoder().decode([ProductModel].self, from: jsonData)
        return products
    }
}
