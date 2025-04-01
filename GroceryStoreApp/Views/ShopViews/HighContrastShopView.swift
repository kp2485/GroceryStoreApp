//
//  HighContrastShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

import SwiftUI

struct HighContrastShopView: View {
    let groupedProducts: [String: [Product]]
    @ObservedObject var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(groupedProducts.keys.sorted(), id: \ .self) { subCategory in
                    VStack(alignment: .leading) {
                        Text(subCategory)
                            .font(.headline)
                            .foregroundColor(.yellow)
                            .padding(.leading)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(groupedProducts[subCategory] ?? []) { product in
                                    ProductItemView(product: product, user: user)
                                        .saturation(2.0)
                                        .contrast(1.5)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.top)
        }
    }
}
