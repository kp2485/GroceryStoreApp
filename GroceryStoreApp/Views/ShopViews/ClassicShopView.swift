//
//  ClassicShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

import SwiftUI

struct ClassicShopView: View {
    let groupedProducts: [String: [Product]]
    @ObservedObject var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(groupedProducts.keys.sorted(), id: \ .self) { subCategory in
                    VStack(alignment: .leading) {
                        NavigationLink(destination: CategoryListView(categoryName: subCategory, products: groupedProducts[subCategory] ?? [], user: user)) {
                            Text(subCategory)
                                .font(.headline)
                                .padding(.leading)
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(groupedProducts[subCategory] ?? []) { product in
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
    }
}
