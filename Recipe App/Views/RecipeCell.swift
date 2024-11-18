//
//  RecipeCell.swift
//  Recipe App
//
//  Created by Parth Barot on 11/15/24.
//

import SwiftUI

struct RecipeCell: View {
    
    let recipe: Recipe
    
    var body: some View {
        HStack {
            RecipeRemoteImage(urlString: recipe.photoURLSmall!)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
    

            VStack(alignment: .leading, spacing: 5) {
                Text(recipe.name ?? "Parth")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(recipe.cuisine ?? "Barot")
                    .font(.title2)
                    .fontWeight(.medium)
                
            }
            .padding(.leading)
        }
    }
}


struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCell(recipe:  MockData.sampleRecipe)
    }
}

