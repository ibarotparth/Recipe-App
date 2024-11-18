//
//  Recipe_AppTests.swift
//  Recipe AppTests
//
//  Created by Parth Barot on 11/13/24.
//


import XCTest
@testable import Recipe_App

final class Recipe_AppTests: XCTestCase {

    var viewModel: RecipeListViewModel!
       var mockNetworkManager: MockNetworkManager!

       override func setUp() {
           super.setUp()
           mockNetworkManager = MockNetworkManager()
           viewModel = RecipeListViewModel(networkManager: mockNetworkManager)
       }

       override func tearDown() {
           viewModel = nil
           mockNetworkManager = nil
           super.tearDown()
       }

       func testGetRecipesSuccess() {
           // Given
           mockNetworkManager.shouldReturnError = false
           mockNetworkManager.mockRecipes = [
            Recipe(uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", cuisine: "Malaysian", name: "Apam Balik", photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"),
            Recipe(uuid: "599344f4-3c5c-4cca-b914-2210e3b3312f", cuisine: "British", name: "Apple & Blackberry Crumble", photoURLLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg", photoURLSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg")
        ]
           
           // When
           viewModel.getRecipes()
           
           // Then
           XCTAssertTrue(viewModel.isLoading)
           
           // Wait for the async completion
           DispatchQueue.main.async {
               XCTAssertFalse(self.viewModel.isLoading)
               XCTAssertEqual(self.viewModel.recipes.count, 2)
               XCTAssertNil(self.viewModel.alertItem)
           }
       }

       func testGetRecipesEmptySuccess() {
           // Given
           mockNetworkManager.shouldReturnError = false
           mockNetworkManager.mockRecipes = []
           
           // When
           viewModel.getRecipes()
           
           // Then
           DispatchQueue.main.async {
               XCTAssertFalse(self.viewModel.isLoading)
               XCTAssertTrue(self.viewModel.recipes.isEmpty)
               XCTAssertEqual(self.viewModel.alertItem, AlertContext.invalidURL)
           }
       }

       func testGetRecipesFailure_invalidData() {
           // Given
           mockNetworkManager.shouldReturnError = true
           mockNetworkManager.errorType = .invalidData
           
           // When
           viewModel.getRecipes()
           
           // Then
           DispatchQueue.main.async {
               XCTAssertFalse(self.viewModel.isLoading)
               XCTAssertEqual(self.viewModel.alertItem, AlertContext.invalidData)
           }
       }

       func testGetRecipesFailure_invalidURL() {
           // Given
           mockNetworkManager.shouldReturnError = true
           mockNetworkManager.errorType = .invalidURL
           
           // When
           viewModel.getRecipes()
           
           // Then
           DispatchQueue.main.async {
               XCTAssertFalse(self.viewModel.isLoading)
               XCTAssertEqual(self.viewModel.alertItem, AlertContext.invalidURL)
           }
       }

       func testGetRecipesFailure_invalidResponse() {
           // Given
           mockNetworkManager.shouldReturnError = true
           mockNetworkManager.errorType = .invalidResponse
           
           // When
           viewModel.getRecipes()
           
           // Then
           DispatchQueue.main.async {
               XCTAssertFalse(self.viewModel.isLoading)
               XCTAssertEqual(self.viewModel.alertItem, AlertContext.invalidResponse)
           }
       }

       func testGetRecipesFailure_unableToComplete() {
           // Given
           mockNetworkManager.shouldReturnError = true
           mockNetworkManager.errorType = .unableToComplete
           
           // When
           viewModel.getRecipes()
           
           // Then
           DispatchQueue.main.async {
               XCTAssertFalse(self.viewModel.isLoading)
               XCTAssertEqual(self.viewModel.alertItem, AlertContext.unableToComplete)
           }
       }

}
