//
//  RecipeListView.swift
//  Recipe App
//
//  Created by Parth Barot on 11/15/24.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject private var viewModel = RecipeListViewModel()
        
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.recipes, id: \.id) { recipe in
                    RecipeCell(recipe: recipe)
                }
                .navigationTitle("Recipes")
            }
            .onAppear {
                viewModel.getRecipes()
            }
            
            if viewModel.isLoading { LoadingView() }
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}


struct RecipeListViewPreviews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
