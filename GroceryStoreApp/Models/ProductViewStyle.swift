//
//  ProductViewStyle.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 4/1/25.
//

enum ProductViewStyle: String, CaseIterable, Identifiable {
    case classic = "Classic"
    case largeText = "Large Text"
    case simplified = "Simplified"
    case highContrast = "High Contrast"
    case gridView = "Grid View"

    var id: String { rawValue }
}
