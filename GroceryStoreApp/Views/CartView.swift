//
//  CartView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var user: User
    @ObservedObject var productStore: ProductStore
    @State private var isDelivery: Bool = true

    var body: some View {
        VStack {
            Text("Your Cart")
                .font(.largeTitle)
                .padding()
            Picker("Delivery Method", selection: $isDelivery) {
                Text("Delivery").tag(true)
                Text("Pickup").tag(false)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            List {
                ForEach(user.cart.keys.compactMap { pid in
                    productStore.product(withId: pid)
                }) { product in
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("Qty: \(user.cart[product.id] ?? 0)")
                    }
                }
            }
            
            Button(action: {
                user.checkoutCart()
            }) {
                Text("Place Order Now")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
        .navigationTitle("Cart")
    }
}
