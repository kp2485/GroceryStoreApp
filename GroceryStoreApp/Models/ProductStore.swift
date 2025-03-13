//
//  ProductStore.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

import Foundation

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    // Lookup product by id
    func product(withId id: UUID) -> Product? {
        products.first { $0.id == id }
    }
    
    // Filter products by a specific category
    func products(inCategory category: ProductCategory) -> [Product] {
        products.filter { $0.category == category }
    }
}
