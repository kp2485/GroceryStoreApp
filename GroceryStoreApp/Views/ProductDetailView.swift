//
//  ProductDetailView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 300, height: 300)
                .overlay(
                    Group {
                        if UIImage(named: product.name) != nil {
                            Image(product.name)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 280, height: 280)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 280, height: 280)
                        }
                    }
                )
                .gesture(MagnificationGesture().onChanged { value in
                    scale = value
                })
                .scaleEffect(scale)
                .padding()
            Text(product.name)
                .font(.title)
            Text(product.brand)
                .font(.subheadline)
            Text("$\(String(format: "%.2f", product.price))")
                .font(.headline)
            Spacer()
        }
        .padding()
        .navigationTitle(product.name)
    }
}
