//
//  Product.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

import Foundation

struct Product: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var brand: String
    var price: Double
    var salePrice: Double?
    let category: ProductCategory
    let inStock: Bool
    let onSale: Bool
    
    init(id: UUID = UUID(), name: String, brand: String, price: Double, salePrice: Double? = nil, category: ProductCategory, inStock: Bool, onSale: Bool) {
            self.id = id
            self.name = name
            self.brand = brand
            self.price = price
            self.salePrice = salePrice
            self.category = category
            self.inStock = inStock
            self.onSale = onSale
        }
}
