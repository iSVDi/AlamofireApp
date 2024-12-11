//
//  NetworkService.swift
//  AlamofireApp
//
//  Created by Daniil on 11.12.2024.
//

import Foundation
import Alamofire

final class NetworkService {
    private let domen = "https://dummyjson.com/"
    private let recipes = "recipes"

    func onAppearHandler() {
        Task {
            do {
                 try await makeRouterRequest(.getAllRecipes)
                 try await makeRouterRequest(.getSingleRecipe(id: 1))
                 try await makeRouterRequest(.searchRecipes(query: "Margherita"))
            } catch {
                
            }
            
        }
        
    }
    // MARK: - Usage -
    
    // MARK: Introduction - Making Requests, Response Handling, Response Validation, Response Caching
    func makeRequest() {
        AF.request(domen + recipes).response() { response in
            guard let data = response.data else { return }
            do {
                let recipe = try JSONDecoder().decode(RecipesAnswer.self, from: data)
                print(recipe)
            } catch {
                print("Error while decode recipe: \(error)")
            }
        }
    }
    
    func makeRequestAndConvertToModel() {
        AF.request(domen + recipes)
            .responseDecodable(of: RecipesAnswer.self) { response in
            switch response.result {
            case .success(let answer):
                print()
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func makeRequestAsync() async {
        do {
            let value = try await AF.request(domen + recipes).serializingDecodable(RecipesAnswer.self).value
            print()
        } catch {
            print("Error while make request async: \(error)")
            }
        
    }
    
    func makeRouterRequest(_ requestType: RecipesRouter) async throws {
        do {
            let res = try await
            AF.request(requestType)
                .serializingDecodable(RecipesAnswer.self)
                .value
            print()
        } catch {
            print("Error while make router request: \(error)")
        }
        
    }
    
    // MARK: HTTP - HTTP Methods, Parameters and Parameter Encoder, HTTP Headers, Authentication
    
    // MARK: Large Data - Downloading Data to a File, Uploading Data to a Server
    
    // MARK: Tools - Statistical Metrics, cURL Command Output
    
    
}
