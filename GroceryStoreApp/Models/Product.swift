//
//  Product.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let brand: String
    let price: Double
    let salePrice: Double?
    let category: ProductCategory
    let inStock: Bool
    let onSale: Bool
}
