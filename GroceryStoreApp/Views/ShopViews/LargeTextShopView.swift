//
//  LargeTextShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

import SwiftUI

struct LargeTextShopView: View {
    let groupedProducts: [String: [Product]]
    @ObservedObject var user: User
    @Binding var selectedSubcategory: String

    var body: some View {
        let subcategories = groupedProducts.keys.sorted()
        let currentSubcategory = selectedSubcategory.isEmpty ? subcategories.first ?? "" : selectedSubcategory
        let products = groupedProducts[currentSubcategory] ?? []

        VStack(alignment: .leading) {
            Menu {
                ForEach(subcategories, id: \ .self) { sub in
                    Button(action: { selectedSubcategory = sub }) {
                        Text(sub)
                    }
                }
            } label: {
                HStack {
                    Text(currentSubcategory)
                        .font(.title2.bold())
                    Image(systemName: "chevron.down")
                }
                .padding(.horizontal)
            }

            List(products) { product in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(product.name)
                            .font(.title2.weight(.bold))
                        Text(product.brand)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                    
                    Spacer()
                    
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.title)
                        .foregroundColor(.green)
                }
            }
            .listStyle(.plain)
        }
    }
}
