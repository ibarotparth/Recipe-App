//
//  Recipe.swift
//  Recipe App
//
//  Created by Parth Barot on 11/15/24.
//

import Foundation

struct Recipe: Codable, Identifiable {
    var id = UUID()  // Unique identifier for SwiftUI List
    let uuid: String
    let cuisine: String?
    let name: String?
    let photoURLLarge: String?
    let photoURLSmall: String?
    
    private enum CodingKeys: String, CodingKey {
        case uuid
        case cuisine
        case name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
    }
    
    // Initializer to generate `id` from `uuid`
        init(uuid: String, cuisine: String?, name: String?, photoURLLarge: String?, photoURLSmall: String?) {
            self.id = UUID()  // Generate a new UUID for each instance
            self.uuid = uuid
            self.cuisine = cuisine
            self.name = name
            self.photoURLLarge = photoURLLarge
            self.photoURLSmall = photoURLSmall
        }
}


struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct MockData {
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe]

    static let sampleRecipe = Recipe(uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", cuisine: "Malaysian", name: "Apam Balik", photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg")
}
