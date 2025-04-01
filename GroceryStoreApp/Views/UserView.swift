//
//  UserView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var user: User

    var body: some View {
        VStack {
            Text("User Profile")
                .font(.largeTitle)
                .padding()
            Text("Hello, \(user.name)")
                .font(.title2)
            Spacer()
        }
        .navigationTitle("User")
    }
}
