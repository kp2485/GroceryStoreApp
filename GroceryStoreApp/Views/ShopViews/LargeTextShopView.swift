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

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(groupedProducts.keys.sorted(), id: \ .self) { subCategory in
                    VStack(alignment: .leading) {
                        Text(subCategory)
                            .font(.title2.bold())
                            .padding(.leading)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(groupedProducts[subCategory] ?? []) { product in
                                    ProductItemView(product: product, user: user)
                                        .scaleEffect(1.2)
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
