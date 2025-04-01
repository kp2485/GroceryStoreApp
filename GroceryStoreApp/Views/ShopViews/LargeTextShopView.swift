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

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(products) { product in
                        ProductItemView(product: product, user: user)
                            .scaleEffect(1.2)
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.top)
    }
}
