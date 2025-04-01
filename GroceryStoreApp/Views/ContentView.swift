//
//  ContentView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var productStore: ProductStore
    @ObservedObject var user: User

    var body: some View {
        TabView {
            NavigationView {
                ShopView(productStore: productStore, user: user)
            }
            .tabItem {
                Label("Shop", systemImage: "cart")
            }
            
            NavigationView {
                CartView(user: user, productStore: productStore)
            }
            .tabItem {
                Label("Cart", systemImage: "bag")
            }
            
            NavigationView {
                QuickActionsView()
            }
            .tabItem {
                Label("Quick Actions", systemImage: "bolt")
            }
            
            NavigationView {
                UserView(user: user)
            }
            .tabItem {
                Label("User", systemImage: "person")
            }
        }
    }
}
