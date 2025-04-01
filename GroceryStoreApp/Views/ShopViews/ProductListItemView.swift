//
//  ProductListItemView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct ProductListItemView: View {
    let product: Product
    @ObservedObject var user: User

    var body: some View {
        HStack {
            NavigationLink(destination: ProductDetailView(product: product)) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Group {
                            if UIImage(named: product.name) != nil {
                                Image(product.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            } else {
                                Image(systemName: "questionmark.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.blue)
                            }
                        }
                    )
            }
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                Text(product.brand)
                    .font(.subheadline)
                Text("$\(String(format: "%.2f", product.price))")
                    .font(.subheadline)
            }
            Spacer()
            VStack {
                Button(action: { user.addToCart(product: product) }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                }
                if let qty = user.cart[product.id], qty > 0 {
                    Button(action: { user.removeFromCart(product: product) }) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
