//
//  User.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

import Foundation

class User: Identifiable, ObservableObject {
    let id: UUID = UUID()
    let name: String
    // Cart maps product IDs to quantities
    @Published var cart: [UUID: Int]
    // Order history maps product IDs to a tuple of (order date, total quantity ordered)
    @Published var orderHistory: [UUID: (date: Date, quantity: Int)]
    
    init(name: String, cart: [UUID: Int] = [:], orderHistory: [UUID: (date: Date, quantity: Int)] = [:]) {
        self.name = name
        self.cart = cart
        self.orderHistory = orderHistory
    }
    
    // Add product to the cart
    func addToCart(product: Product, quantity: Int = 1) {
        cart[product.id, default: 0] += quantity
    }
    
    // Remove product from the cart
    func removeFromCart(product: Product, quantity: Int = 1) {
        if let currentQuantity = cart[product.id] {
            let newQuantity = currentQuantity - quantity
            if newQuantity <= 0 {
                cart.removeValue(forKey: product.id)
            } else {
                cart[product.id] = newQuantity
            }
        }
    }
    
    // Function to add the entire cart to the order history
    func checkoutCart() {
        let currentDate = Date()
        
        // TODO: Complete payment
        
        for (productID, quantity) in cart {
            if let existingOrder = orderHistory[productID] {
                orderHistory[productID] = (date: currentDate, quantity: existingOrder.quantity + quantity)
            } else {
                orderHistory[productID] = (date: currentDate, quantity: quantity)
            }
        }
        cart.removeAll() // Empty the cart after checkout
    }
}

