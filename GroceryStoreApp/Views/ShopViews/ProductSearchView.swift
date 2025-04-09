//
//  ProductSearchView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/8/25.
//

import SwiftUI

struct ProductSearchView: View {
    @Binding var isPresented: Bool
    @Binding var searchText: String
    let products: [Product]

    var searchResults: [Product] {
        if searchText.isEmpty {
            return []
        }
        return products.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.brand.localizedCaseInsensitiveContains(searchText) ||
            $0.category.main.localizedCaseInsensitiveContains(searchText) ||
            $0.category.sub.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search products...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                if searchResults.isEmpty && !searchText.isEmpty {
                    Text("No results found.")
                        .foregroundColor(.secondary)
                        .padding()
                }
                List {
                    ForEach(searchResults) { product in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(product.name)
                                .font(.headline)
                            Text(product.brand)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("\(product.category.main) > \(product.category.sub)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Search")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        isPresented = false
                        searchText = ""
                    }
                }
            }
        }
        .presentationDetents([.fraction(0.75)])
    }
}
