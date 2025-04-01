//
//  ProductStore.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

import Foundation

class ProductStore: ObservableObject, @unchecked Sendable {
    @Published var products: [Product] = []
    
    // Lookup product by id
    func product(withId id: UUID) -> Product? {
        products.first { $0.id == id }
    }
    
    // Filter products by a specific category
    func products(inCategory category: ProductCategory) -> [Product] {
        products.filter { $0.category == category }
    }
    
    // Load products from JSON file
    func loadProducts(from fileName: String) async {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("⚠️ Failed to find \(fileName) in bundle.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedProducts = try JSONDecoder().decode([Product].self, from: data)
            
            DispatchQueue.main.async {
                self.products.append(contentsOf: decodedProducts)
            }
        } catch {
            print("❌ Error loading \(fileName): \(error.localizedDescription)")
        }
    }
}
