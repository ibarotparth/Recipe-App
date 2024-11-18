//
//  RecipeListViewModel.swift
//  Recipe App
//
//  Created by Parth Barot on 11/15/24.
//

import Foundation

final class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    
    private let networkManager: NetworkManagerProtocol
        
        init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
            self.networkManager = networkManager
        }
    
    func getRecipes() {
        isLoading = true
        
        NetworkManager.shared.getRecipes { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let recipes):
                    if recipes.isEmpty {
                        self.alertItem = AlertContext.emptyData
                    } else {
                        self.recipes = recipes
                    }
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    case .emptyData:
                        self.alertItem = AlertContext.emptyData
                    }
                }
            }
        }
    }
}
