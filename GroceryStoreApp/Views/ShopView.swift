//
//  ShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct ShopView: View {
    @ObservedObject var productStore: ProductStore
    @ObservedObject var user: User
    @State private var selectedMainCategory: String = "Grocery"
    
    // List of all main categories (adjust as needed).
    let mainCategories = [
        "Grocery", "Electronics", "Household Essentials", "Beauty & Personal Care",
        "Toys", "Beer, Wine & Spirits", "Pet Care", "Home", "Baby & Toddler",
        "Sporting Goods", "Our Brands", "Health Care", "Card & Party",
        "Clothing, Shoes & Accessories", "Books & Entertainment",
        "Home Improvement & Auto", "Garden & Outdoor Living"
    ]
    
    // Filter products based on the selected main category.
    var filteredProducts: [Product] {
        productStore.products.filter { product in
            product.category.main.lowercased() == selectedMainCategory.lowercased()
        }
    }
    
    // Group the filtered products by their subcategory.
    var groupedProducts: [String: [Product]] {
        Dictionary(grouping: filteredProducts, by: { product in
            product.category.sub
        })
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(groupedProducts.keys.sorted(), id: \.self) { subCategoryKey in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: CategoryListView(categoryName: subCategoryKey, products: groupedProducts[subCategoryKey] ?? [], user: user)) {
                            Text(subCategoryKey)
                                .font(.headline)
                                .padding(.leading)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(groupedProducts[subCategoryKey] ?? []) { product in
                                    ProductItemView(product: product, user: user)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.top)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Shop")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Picker("Category", selection: $selectedMainCategory) {
                    ForEach(mainCategories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
    }
}
