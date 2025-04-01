//
//  GridShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

import SwiftUI

struct GridShopView: View {
    let groupedProducts: [String: [Product]]
    @ObservedObject var user: User
    @Binding var selectedSubcategory: String

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

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

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(products) { product in
                        ProductItemView(product: product, user: user)
                    }
                }
                .padding()
            }
        }
        .padding(.top)
    }
}
