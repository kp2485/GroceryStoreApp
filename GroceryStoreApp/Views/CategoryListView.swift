//
//  CategoryListView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct CategoryListView: View {
    let categoryName: String
    let products: [Product]
    @ObservedObject var user: User

    var body: some View {
        ScrollView {
            VStack {
                ForEach(products) { product in
                    ProductListItemView(product: product, user: user)
                }
            }
        }
        .navigationTitle(categoryName)
    }
}
