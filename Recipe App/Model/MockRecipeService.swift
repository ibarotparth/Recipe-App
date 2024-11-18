//
//  MockRecipeService.swift
//  Recipe App
//
//  Created by Parth Barot on 11/17/24.
//

import Foundation
import UIKit

class MockNetworkManager: NetworkManagerProtocol {
    var shouldReturnError = false
    var mockRecipes: [Recipe] = [
        Recipe(uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", cuisine: "Malaysian", name: "Apam Balik", photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"),
        Recipe(uuid: "599344f4-3c5c-4cca-b914-2210e3b3312f", cuisine: "British", name: "Apple & Blackberry Crumble", photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg", photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg")
    ]
    
        
    var errorType: APError = .unableToComplete

    func getRecipes(completed: @escaping (Result<[Recipe], APError>) -> Void) {
        if shouldReturnError {
            completed(.failure(errorType))
        } else {
            completed(.success(mockRecipes))
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        // Optional: You can implement this if needed for additional tests.
        completed(nil)
    }
}

        
