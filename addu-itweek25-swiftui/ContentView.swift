//
//  ContentView.swift
//  addu-itweek25-swiftui
//
//  Created by Al Gabriel on 2/22/25.
//

import SwiftUI

struct ContentView: View {
   
    
    @State private var recipes: [Recipe] = []
    @State private var showingAddRecipe = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($recipes) { $recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: $recipe)) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(recipe.name)
                                .font(.headline)
                            Text("\(recipe.cookingTime) minutes")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete(perform: deleteRecipes)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Recipe Book")
            .toolbar {
                Button(action: {
                    showingAddRecipe = true
                }) {
                    Image(systemName: "plus")
                        .padding(8)
                }
            }
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView(recipes: $recipes)
            }
        }
    }
    
    func deleteRecipes(at offsets: IndexSet) {
        recipes.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
