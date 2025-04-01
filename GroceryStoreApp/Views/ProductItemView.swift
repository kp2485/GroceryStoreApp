// ProductItemView.swift
// GroceryStoreApp
//
// Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    @ObservedObject var user: User

    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationLink(destination: ProductDetailView(product: product)) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 120, height: 140)
                    .overlay(
                        Group {
                            if UIImage(named: product.name) != nil {
                                Image(product.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            } else {
                                Text(emojiForCategory(main: product.category.main, sub: product.category.sub))
                                    .font(.system(size: 80))
                            }
                        }
                    )
            }
            .buttonStyle(PlainButtonStyle())

            HStack {
                if let quantity = user.cart[product.id], quantity > 0 {
                    Button(action: { user.removeFromCart(product: product) }) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                    }
                    .padding([.leading, .bottom], 4)
                }
                Spacer()
                Button(action: { user.addToCart(product: product) }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                }
                .padding([.trailing, .bottom], 4)
            }
            .frame(width: 120)
        }
    }

    func emojiForCategory(main: String, sub: String) -> String {
        let mainCategory = main.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let subCategory = sub.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        switch mainCategory {
        case "grocery":
            switch subCategory {
            case "fruits": return "🍎"
            case "vegetables": return "🥕"
            case "prepared foods": return "🥡"
            case "deli": return "🥪"
            case "floral": return "💐"
            case "dairy & eggs": return "🥚"
            case "bakery": return "🥖"
            case "meat & seafood": return "🥩"
            case "pantry": return "🧂"
            case "frozen foods": return "🧊"
            case "beverages": return "🥤"
            case "snacks": return "🍿"
            default: return "🛒"
            }

        case "electronics":
            switch subCategory {
            case "tv & home theater": return "📺"
            case "computers & tablets": return "💻"
            case "cell phones": return "📱"
            case "video games": return "🎮"
            case "cameras": return "📷"
            case "audio": return "🎧"
            case "wearable technology": return "⌚"
            default: return "📦"
            }

        case "household essentials":
            switch subCategory {
            case "cleaning supplies": return "🧼"
            case "paper & plastic products": return "🧻"
            case "laundry care": return "🧺"
            case "dishwashing": return "🍽️"
            case "air fresheners": return "🌀"
            default: return "🏠"
            }

        case "beauty & personal care":
            switch subCategory {
            case "hair care": return "💇‍♀️"
            case "skin care": return "🧴"
            case "makeup": return "💄"
            case "fragrances": return "🌸"
            case "oral care": return "🦷"
            case "shaving & grooming": return "🪒"
            case "bath & body": return "🛁"
            default: return "🧖"
            }

        case "toys":
            switch subCategory {
            case "action figures": return "🦸"
            case "dolls": return "🧸"
            case "building sets": return "🧱"
            case "educational toys": return "📘"
            case "outdoor play": return "🤾"
            case "games & puzzles": return "🧩"
            default: return "🪀"
            }

        case "beer, wine & spirits":
            switch subCategory {
            case "beer": return "🍺"
            case "wine": return "🍷"
            case "spirits": return "🥃"
            case "mixers": return "🧉"
            case "bar accessories": return "🍸"
            default: return "🍹"
            }

        case "pet care":
            switch subCategory {
            case "dog supplies": return "🐶"
            case "cat supplies": return "🐱"
            case "fish supplies": return "🐟"
            case "bird supplies": return "🐦"
            case "small animal supplies": return "🐹"
            default: return "🐾"
            }

        case "home":
            switch subCategory {
            case "bedding": return "🛏️"
            case "bath": return "🛁"
            case "furniture": return "🪑"
            case "home décor", "home decor": return "🖼️"
            case "kitchen & dining": return "🍽️"
            case "storage & organization": return "📦"
            default: return "🏡"
            }

        case "baby & toddler":
            switch subCategory {
            case "diapers & wipes": return "🧷"
            case "feeding": return "🍼"
            case "baby gear": return "👶"
            case "nursery": return "🛏️"
            case "toddler clothing": return "👕"
            default: return "👶"
            }

        case "sporting goods":
            switch subCategory {
            case "fitness equipment": return "🏋️"
            case "outdoor recreation": return "⛺"
            case "team sports": return "🏈"
            case "camping & hiking": return "🥾"
            case "cycling": return "🚴"
            default: return "⚽"
            }

        case "our brands":
            return "🏷️"

        case "health care":
            switch subCategory {
            case "over-the-counter medications": return "💊"
            case "vitamins & supplements": return "🧬"
            case "first aid": return "🩹"
            case "home health care": return "🏥"
            case "personal protective equipment": return "😷"
            default: return "🩺"
            }

        case "card & party":
            switch subCategory {
            case "greeting cards": return "💌"
            case "gift wrap": return "🎁"
            case "party supplies": return "🥳"
            case "balloons": return "🎈"
            default: return "🎊"
            }

        case "clothing, shoes & accessories":
            switch subCategory {
            case "men's clothing": return "👔"
            case "women's clothing": return "👗"
            case "kids' clothing": return "🧒"
            case "shoes": return "👟"
            case "accessories": return "👜"
            default: return "👚"
            }

        case "books & entertainment":
            switch subCategory {
            case "books": return "📚"
            case "movies": return "🎬"
            case "music": return "🎵"
            case "video games": return "🎮"
            default: return "📀"
            }

        case "home improvement & auto":
            switch subCategory {
            case "tools": return "🛠️"
            case "paint & supplies": return "🎨"
            case "hardware": return "🔩"
            case "automotive": return "🚗"
            case "lighting & electrical": return "💡"
            default: return "🧰"
            }

        case "garden & outdoor living":
            switch subCategory {
            case "plants & flowers": return "🌷"
            case "patio furniture": return "🪑"
            case "grills & outdoor cooking": return "🔥"
            case "lawn care": return "🌿"
            case "outdoor décor", "outdoor decor": return "🏡"
            default: return "🌳"
            }

        default:
            return "🛒"
        }
    }
}
