//
//  GridShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

import SwiftUI

struct GridShopView: View {
    let products: [Product]
    @ObservedObject var user: User

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(products) { product in
                    ProductItemView(product: product, user: user)
                }
            }
            .padding()
        }
    }
}
