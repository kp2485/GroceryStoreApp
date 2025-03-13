//
//  ProductCategory.swift
//  GroceryStoreApp
//
//  Created by Kyle Peterson on 3/13/25.
//

enum ProductCategory: Hashable {
    case grocery(GrocerySubcategory)
    case fresh(FreshSubcategory)
    case electronics(ElectronicsSubcategory)
    case householdEssentials(HouseholdEssentialsSubcategory)
    case beautyAndPersonalCare(BeautyAndPersonalCareSubcategory)
    case toys(ToysSubcategory)
    case beerWineAndSpirits(BeerWineAndSpiritsSubcategory)
    case petCare(PetCareSubcategory)
    case home(HomeSubcategory)
    case babyAndToddler(BabyAndToddlerSubcategory)
    case sportingGoods(SportingGoodsSubcategory)
    case ourBrands(OurBrandsSubcategory)
    case healthCare(HealthCareSubcategory)
    case cardAndParty(CardAndPartySubcategory)
    case clothingShoesAndAccessories(ClothingShoesAndAccessoriesSubcategory)
    case booksAndEntertainment(BooksAndEntertainmentSubcategory)
    case homeImprovementAndAuto(HomeImprovementAndAutoSubcategory)
    case gardenAndOutdoorLiving(GardenAndOutdoorLivingSubcategory)
}

enum GrocerySubcategory: String, CaseIterable, Hashable {
    case freshProduce = "Fresh Produce"
    case dairyAndEggs = "Dairy & Eggs"
    case bakery = "Bakery"
    case meatAndSeafood = "Meat & Seafood"
    case pantry = "Pantry"
    case frozenFoods = "Frozen Foods"
    case beverages = "Beverages"
    case snacks = "Snacks"
}

enum FreshSubcategory: String, CaseIterable, Hashable {
    case fruits = "Fruits"
    case vegetables = "Vegetables"
    case preparedFoods = "Prepared Foods"
    case deli = "Deli"
    case floral = "Floral"
}

enum ElectronicsSubcategory: String, CaseIterable, Hashable {
    case tvAndHomeTheater = "TV & Home Theater"
    case computersAndTablets = "Computers & Tablets"
    case cellPhones = "Cell Phones"
    case videoGames = "Video Games"
    case cameras = "Cameras"
    case audio = "Audio"
    case wearableTechnology = "Wearable Technology"
}

enum HouseholdEssentialsSubcategory: String, CaseIterable, Hashable {
    case cleaningSupplies = "Cleaning Supplies"
    case paperAndPlasticProducts = "Paper & Plastic Products"
    case laundryCare = "Laundry Care"
    case dishwashing = "Dishwashing"
    case airFresheners = "Air Fresheners"
}

enum BeautyAndPersonalCareSubcategory: String, CaseIterable, Hashable {
    case hairCare = "Hair Care"
    case skinCare = "Skin Care"
    case makeup = "Makeup"
    case fragrances = "Fragrances"
    case oralCare = "Oral Care"
    case shavingAndGrooming = "Shaving & Grooming"
    case bathAndBody = "Bath & Body"
}

enum ToysSubcategory: String, CaseIterable, Hashable {
    case actionFigures = "Action Figures"
    case dolls = "Dolls"
    case buildingSets = "Building Sets"
    case educationalToys = "Educational Toys"
    case outdoorPlay = "Outdoor Play"
    case gamesAndPuzzles = "Games & Puzzles"
}

enum BeerWineAndSpiritsSubcategory: String, CaseIterable, Hashable {
    case beer = "Beer"
    case wine = "Wine"
    case spirits = "Spirits"
    case mixers = "Mixers"
    case barAccessories = "Bar Accessories"
}

enum PetCareSubcategory: String, CaseIterable, Hashable {
    case dogSupplies = "Dog Supplies"
    case catSupplies = "Cat Supplies"
    case fishSupplies = "Fish Supplies"
    case birdSupplies = "Bird Supplies"
    case smallAnimalSupplies = "Small Animal Supplies"
}

enum HomeSubcategory: String, CaseIterable, Hashable {
    case bedding = "Bedding"
    case bath = "Bath"
    case furniture = "Furniture"
    case homeDecor = "Home Décor"
    case kitchenAndDining = "Kitchen & Dining"
    case storageAndOrganization = "Storage & Organization"
}

enum BabyAndToddlerSubcategory: String, CaseIterable, Hashable {
    case diapersAndWipes = "Diapers & Wipes"
    case feeding = "Feeding"
    case babyGear = "Baby Gear"
    case nursery = "Nursery"
    case toddlerClothing = "Toddler Clothing"
}

enum SportingGoodsSubcategory: String, CaseIterable, Hashable {
    case fitnessEquipment = "Fitness Equipment"
    case outdoorRecreation = "Outdoor Recreation"
    case teamSports = "Team Sports"
    case campingAndHiking = "Camping & Hiking"
    case cycling = "Cycling"
}

enum OurBrandsSubcategory: String, CaseIterable, Hashable {
    case meijerBrandProducts = "Meijer Brand Products"
    case frederiksByMeijer = "Frederik's by Meijer"
    case trueGoodness = "True Goodness"
    case purpleCow = "Purple Cow"
}

enum HealthCareSubcategory: String, CaseIterable, Hashable {
    case overTheCounterMedications = "Over-the-Counter Medications"
    case vitaminsAndSupplements = "Vitamins & Supplements"
    case firstAid = "First Aid"
    case homeHealthCare = "Home Health Care"
    case personalProtectiveEquipment = "Personal Protective Equipment"
}

enum CardAndPartySubcategory: String, CaseIterable, Hashable {
    case greetingCards = "Greeting Cards"
    case giftWrap = "Gift Wrap"
    case partySupplies = "Party Supplies"
    case balloons = "Balloons"
}

enum ClothingShoesAndAccessoriesSubcategory: String, CaseIterable, Hashable {
    case mensClothing = "Men's Clothing"
    case womensClothing = "Women's Clothing"
    case kidsClothing = "Kids' Clothing"
    case shoes = "Shoes"
    case accessories = "Accessories"
}

enum BooksAndEntertainmentSubcategory: String, CaseIterable, Hashable {
    case books = "Books"
    case movies = "Movies"
    case music = "Music"
    case videoGames = "Video Games"
}

enum HomeImprovementAndAutoSubcategory: String, CaseIterable, Hashable {
    case tools = "Tools"
    case paintAndSupplies = "Paint & Supplies"
    case hardware = "Hardware"
    case automotive = "Automotive"
    case lightingAndElectrical = "Lighting & Electrical"
}

enum GardenAndOutdoorLivingSubcategory: String, CaseIterable, Hashable {
    case plantsAndFlowers = "Plants & Flowers"
    case patioFurniture = "Patio Furniture"
    case grillsAndOutdoorCooking = "Grills & Outdoor Cooking"
    case lawnCare = "Lawn Care"
    case outdoorDecor = "Outdoor Décor"
}
