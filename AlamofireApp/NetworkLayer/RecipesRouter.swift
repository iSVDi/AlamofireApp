//
//  RecipesRouter.swift
//  AlamofireApp
//
//  Created by Daniil on 11.12.2024.
//

import Foundation
import Alamofire

enum RecipesRouter: URLRequestConvertible {
    case getAllRecipes
    case getSingleRecipe(id: Int)
    case searchRecipes(query: String)
    
    var baseURL: URL {
        return URL(string: "https://dummyjson.com/recipes")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getAllRecipes:
            return ""
        case .getSingleRecipe(let id):
            return "/\(id)"
        case .searchRecipes(query: let query):
            return "/search?q=\(query)"
        }
    }
    
    func serializingDecodable() -> (Decodable & Sendable).Type {
        switch self {
        case .getAllRecipes, .searchRecipes(_):
            return RecipesAnswer.self
        case .getSingleRecipe(_):
            return Recipe.self
        }
    }
    var serializingDecodableType: Sendable.Type {
        switch self {
        case .getAllRecipes, .searchRecipes(_):
            return RecipesAnswer.self
        case .getSingleRecipe(_):
            return Recipe.self
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
}
