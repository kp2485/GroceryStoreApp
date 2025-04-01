//
//  LoadingView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/14/25.
//

import SwiftUI

struct LoadingView: View {
    @ObservedObject var productStore: ProductStore
    @State private var progress: Double = 0.0
    @State private var statusMessage: String = "Starting..."
    
    private let jsonFiles = [
        "grocery_products.json", "electronics_products.json", "household_essentials_products.json",
        "beauty_personal_care_products.json", "toys_products.json", "beer_wine_spirits_products.json",
        "pet_care_products.json", "home_products.json", "baby_and_toddler_products.json",
        "sporting_goods_products.json", "our_brands_products.json", "health_care_products.json",
        "card_and_party_products.json", "clothing_shoes_accessories_products.json",
        "books_and_entertainment_products.json", "home_improvement_and_auto_products.json",
        "garden_and_outdoor_living_products.json"
    ]
    
    var body: some View {
        VStack {
            Text("Loading Products...")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            
            ProgressView(value: progress, total: Double(jsonFiles.count))
                .progressViewStyle(LinearProgressViewStyle())
                .padding()
            
            Text(statusMessage)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(.top, 5)
        }
        .padding()
        .onAppear {
            loadAllProducts()
        }
    }
    
    private func loadAllProducts() {
        Task {
            for (index, fileName) in jsonFiles.enumerated() {
                await loadProducts(from: fileName)
                progress = Double(index + 1)
                statusMessage = "Loaded \(fileName)"
            }
            statusMessage = "All products loaded successfully!"
        }
    }
    
    private func loadProducts(from fileName: String) async {
        await productStore.loadProducts(from: fileName)
    }
}
