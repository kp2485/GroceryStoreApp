//
//  SimplifiedShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

import SwiftUI

struct SimplifiedShopView: View {
    let groupedProducts: [String: [Product]]
    @ObservedObject var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(groupedProducts.keys.sorted(), id: \ .self) { subCategory in
                    VStack(alignment: .leading) {
                        Text(subCategory)
                            .font(.headline)
                            .padding(.leading)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(groupedProducts[subCategory] ?? []) { product in
                                    ProductItemView(product: product, user: user)
                                        .grayscale(1.0)
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
