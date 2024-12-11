//
//  Recipe.swift
//  AlamofireApp
//
//  Created by Daniil on 11.12.2024.
//


// MARK: - Welcome
struct RecipesAnswer: Codable, Sendable {
    let recipes: [Recipe]
    let total, skip, limit: Int
}

// MARK: - Recipe
struct Recipe: Codable {
    let id: Int
    let name: String
    let ingredients, instructions: [String]
    let prepTimeMinutes, cookTimeMinutes, servings: Int
    let difficulty, cuisine: String
    let caloriesPerServing: Int
    let tags: [String]
    let userID: Int
    let image: String
    let rating: Double
    let reviewCount: Int
    let mealType: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, ingredients, instructions, prepTimeMinutes, cookTimeMinutes, servings, difficulty, cuisine, caloriesPerServing, tags
        case userID = "userId"
        case image, rating, reviewCount, mealType
    }
}
