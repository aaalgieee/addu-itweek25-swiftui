import SwiftUI

struct RecipeDetailView: View {
    // Changed recipe to @Binding to support editing
    @Binding var recipe: Recipe
    @State private var showingEditSheet = false
    
    var body: some View {
        Form {
            Section("Recipe Details") {
                Text(recipe.name)
                    .font(.headline)
                    .padding(.vertical, 8)
            }
            
            Section("Ingredients") {
                Text(recipe.ingredients)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Section("Cooking Time") {
                Text("\(recipe.cookingTime) minutes")
                    .padding(.vertical, 8)
            }
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
                showingEditSheet = true
            }
            .padding(8)
        }
        .sheet(isPresented: $showingEditSheet) {
            EditRecipeView(recipe: $recipe)
        }
    }
}
