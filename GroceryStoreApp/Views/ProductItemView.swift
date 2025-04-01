//
//  ProductItemView.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/28/25.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    @ObservedObject var user: User

    var body: some View {
        // Use a ZStack for the product image (wrapped in a rounded rectangle)
        // and overlay the + and - buttons.
        ZStack(alignment: .bottom) {
            // Wrap the product view in a NavigationLink to ProductDetailView.
            NavigationLink(destination: ProductDetailView(product: product)) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 120, height: 140)
                    .overlay(
                        // Try to load an image named exactly as the product name.
                        // If not found, use a default system image based on category.
                        Group {
                            if UIImage(named: product.name) != nil {
                                Image(product.name)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            } else {
                                Image(systemName: systemImageName(main: product.category.main, sub: product.category.sub))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.blue)
                            }
                        }
                    )
            }
            .buttonStyle(PlainButtonStyle())
            
            // Overlay the plus button in the bottom right and a minus button in the bottom left if the item is in the cart.
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
    
    // Return a system image name based on the product category's main property.
    func systemImageName(main: String, sub: String) -> String {
        // Normalize strings.
        let mainCategory = main.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let subCategory = sub.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch mainCategory {
        case "grocery":
            switch subCategory {
            case "fresh produce":
                return "leaf.fill"
            case "dairy & eggs":
                return "drop.fill"
            case "bakery":
                return "bag.fill"
            case "meat & seafood":
                return "fork.knife"  // Alternatively, consider "takeoutbag.and.cup.and.straw.fill"
            case "pantry":
                return "archivebox.fill"
            case "frozen foods":
                return "snowflake"
            case "beverages":
                return "cup.and.saucer.fill"
            case "snacks":
                return "bag.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "fresh":
            switch subCategory {
            case "fruits":
                return "sun.max.fill"
            case "vegetables":
                return "leaf.arrow.triangle.circlepath"
            case "prepared foods":
                return "fork.knife"
            case "deli":
                return "takeoutbag.and.cup.and.straw.fill"
            case "floral":
                return "sparkles"
            default:
                return "questionmark.square.fill"
            }
            
        case "electronics":
            switch subCategory {
            case "tv & home theater":
                return "tv.fill"
            case "computers & tablets":
                return "desktopcomputer"
            case "cell phones":
                return "iphone"
            case "video games":
                return "gamecontroller.fill"
            case "cameras":
                return "camera.fill"
            case "audio":
                return "speaker.3.fill"
            case "wearable technology":
                return "applewatch"
            default:
                return "questionmark.square.fill"
            }
            
        case "household essentials":
            switch subCategory {
            case "cleaning supplies":
                return "sparkles"
            case "paper & plastic products":
                return "doc.on.doc.fill"
            case "laundry care":
                return "drop.fill"
            case "dishwashing":
                return "fork.knife"
            case "air fresheners":
                return "wind"
            default:
                return "questionmark.square.fill"
            }
            
        case "beauty & personal care":
            switch subCategory {
            case "hair care":
                return "scissors" // or a custom comb icon if available
            case "skin care":
                return "face.smiling.fill"
            case "makeup":
                return "paintbrush.fill"
            case "fragrances":
                return "drop.fill"
            case "oral care":
                return "mouth.fill"
            case "shaving & grooming":
                return "scissors"
            case "bath & body":
                return "drop.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "toys":
            switch subCategory {
            case "action figures":
                return "figure.walk"
            case "dolls":
                return "person.fill"
            case "building sets":
                return "cube.fill"
            case "educational toys":
                return "book.fill"
            case "outdoor play":
                return "sportscourt.fill"
            case "games & puzzles":
                return "puzzlepiece.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "beer, wine, & spirits":
            switch subCategory {
            case "beer":
                return "cup.and.saucer.fill"
            case "wine":
                return "wineglass.fill"
            case "spirits":
                return "flame.fill"
            case "mixers":
                return "sparkles"
            case "bar accessories":
                return "fork.knife"
            default:
                return "questionmark.square.fill"
            }
            
        case "pet care":
            switch subCategory {
            case "dog supplies":
                return "pawprint.fill"
            case "cat supplies":
                return "pawprint.fill"
            case "fish supplies":
                return "fish.fill"
            case "bird supplies":
                return "bird.fill"
            case "small animal supplies":
                return "hare.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "home":
            switch subCategory {
            case "bedding":
                return "bed.double.fill"
            case "bath":
                return "bathtub.fill"
            case "furniture":
                return "sofa.fill"
            case "home décor", "home decor":
                return "photo.fill"
            case "kitchen & dining":
                return "fork.knife"
            case "storage & organization":
                return "archivebox.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "baby & toddler":
            switch subCategory {
            case "diapers & wipes":
                return "bandage.fill"
            case "feeding":
                return "cup.and.saucer.fill"
            case "baby gear":
                return "bag.fill"
            case "nursery":
                return "bed.double.fill"
            case "toddler clothing":
                return "tshirt.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "sporting goods":
            switch subCategory {
            case "fitness equipment":
                return "figure.walk"
            case "outdoor recreation":
                return "sun.max.fill"
            case "team sports":
                return "sportscourt.fill"
            case "camping & hiking":
                return "tent.fill"
            case "cycling":
                return "bicycle"
            default:
                return "questionmark.square.fill"
            }
            
        case "our brands":
            // For "Our Brands," we use the same icon for all.
            return "tag.fill"
            
        case "health care":
            switch subCategory {
            case "over-the-counter medications":
                return "pills.fill"
            case "vitamins & supplements":
                return "capsule.fill"
            case "first aid":
                return "cross.fill"
            case "home health care":
                return "house.fill"
            case "personal protective equipment":
                return "shield.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "card & party":
            switch subCategory {
            case "greeting cards":
                return "envelope.fill"
            case "gift wrap":
                return "gift.fill"
            case "party supplies":
                return "sparkles"
            case "balloons":
                return "circle.grid.3x3.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "clothing, shoes & accessories":
            switch subCategory {
            case "men's clothing":
                return "person.fill"
            case "women's clothing":
                return "person.fill"
            case "kids' clothing":
                return "person.fill"
            case "shoes":
                return "shoeprints.fill"
            case "accessories":
                return "eyeglasses"
            default:
                return "questionmark.square.fill"
            }
            
        case "books & entertainment":
            switch subCategory {
            case "books":
                return "book.fill"
            case "movies":
                return "film.fill"
            case "music":
                return "music.note"
            case "video games":
                return "gamecontroller.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "home improvement & auto":
            switch subCategory {
            case "tools":
                return "wrench.fill"
            case "paint & supplies":
                return "paintbrush.fill"
            case "hardware":
                return "hammer.fill"
            case "automotive":
                return "car.fill"
            case "lighting & electrical":
                return "lightbulb.fill"
            default:
                return "questionmark.square.fill"
            }
            
        case "garden & outdoor living":
            switch subCategory {
            case "plants & flowers":
                return "leaf.fill"
            case "patio furniture":
                return "sofa.fill"
            case "grills & outdoor cooking":
                return "flame.fill"
            case "lawn care":
                return "leaf.arrow.triangle.circlepath"
            case "outdoor décor", "outdoor decor":
                return "photo.fill"
            default:
                return "questionmark.square.fill"
            }
            
        default:
            return "questionmark.square.fill"
        }
    }

}
