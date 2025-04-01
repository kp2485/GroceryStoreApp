//
//  MainAppView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI
import Foundation

struct MainAppView: View {
    @StateObject var productStore = ProductStore()
    @StateObject var user = User(name: "John Doe")
    @State private var isLoadingComplete = false

    var body: some View {
        ZStack {
            if isLoadingComplete {
                // Transition into the main ContentView (TabView) with animation.
                ContentView(productStore: productStore, user: user)
                    .transition(.opacity.animation(.easeInOut))
            } else {
                // Show the loading screen while JSON files are loaded.
                LoadingView(productStore: productStore)
            }
        }
        .onAppear {
            // Simulate loading delay. In your actual app, set isLoadingComplete
            // when all JSON files have been loaded.
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isLoadingComplete = true
                }
            }
        }
    }
}
