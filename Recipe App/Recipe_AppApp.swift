//
//  Recipe_AppApp.swift
//  Recipe App
//
//  Created by Parth Barot on 11/13/24.
//

import SwiftUI

@main
struct Recipe_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RecipeListView()
        }
    }
}
