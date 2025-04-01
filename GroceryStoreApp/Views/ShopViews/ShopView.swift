//
//  ShopView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct ShopView: View {
    @ObservedObject var productStore: ProductStore
    @ObservedObject var user: User

    @AppStorage("selectedViewStyle") private var selectedViewStyleRaw: String = ProductViewStyle.classic.rawValue
    @State private var selectedMainCategory: String = "Grocery"

    var selectedViewStyle: ProductViewStyle {
        ProductViewStyle(rawValue: selectedViewStyleRaw) ?? .classic
    }

    let mainCategories = [
        "Grocery", "Electronics", "Household Essentials", "Beauty & Personal Care",
        "Toys", "Beer, Wine & Spirits", "Pet Care", "Home", "Baby & Toddler",
        "Sporting Goods", "Our Brands", "Health Care", "Card & Party",
        "Clothing, Shoes & Accessories", "Books & Entertainment",
        "Home Improvement & Auto", "Garden & Outdoor Living"
    ]

    var filteredProducts: [Product] {
        productStore.products.filter { $0.category.main.lowercased() == selectedMainCategory.lowercased() }
    }

    var groupedProducts: [String: [Product]] {
        Dictionary(grouping: filteredProducts, by: { $0.category.sub })
    }

    var body: some View {
        Group {
            switch selectedViewStyle {
            case .classic:
                ClassicShopView(groupedProducts: groupedProducts, user: user)
            case .largeText:
                LargeTextShopView(groupedProducts: groupedProducts, user: user)
            case .simplified:
                SimplifiedShopView(groupedProducts: groupedProducts, user: user)
            case .highContrast:
                HighContrastShopView(groupedProducts: groupedProducts, user: user)
            case .gridView:
                GridShopView(products: filteredProducts, user: user)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Menu {
                    ForEach(mainCategories, id: \ .self) { category in
                        Button(action: { selectedMainCategory = category }) {
                            Text(category)
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedMainCategory)
                            .font(.title2)
                            .foregroundColor(.primary)
                        Image(systemName: "chevron.down")
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    ForEach(ProductViewStyle.allCases) { style in
                        Button(action: {
                            selectedViewStyleRaw = style.rawValue
                        }) {
                            Label(style.rawValue, systemImage: icon(for: style))
                        }
                    }
                } label: {
                    Image(systemName: icon(for: selectedViewStyle))
                }
            }
        }
    }

    func icon(for style: ProductViewStyle) -> String {
        switch style {
        case .classic: return "rectangle.grid.1x2"
        case .largeText: return "textformat.size.larger"
        case .simplified: return "line.3.horizontal.decrease"
        case .highContrast: return "circle.lefthalf.filled"
        case .gridView: return "square.grid.2x2"
        }
    }
}
