// ProductCategory.swift
// GroceryStoreApp
//
// Created by Kyle Peterson on 3/13/25.
//

import Foundation

struct ProductCategory: Codable, Hashable {
    let main: String
    let sub: String

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let category = try container.decode([String: String].self)
        
        guard let (main, sub) = category.first else {
            throw DecodingError.dataCorruptedError(in: container,
                debugDescription: "Invalid ProductCategory format.")
        }

        self.main = main
        self.sub = sub
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode([main: sub])
    }
}
