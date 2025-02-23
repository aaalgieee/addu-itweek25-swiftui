import SwiftUI

struct EditRecipeView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipe: Recipe
    
    @State private var name: String
    @State private var ingredients: String
    @State private var cookingTime: String
    
    init(recipe: Binding<Recipe>) {
        self._recipe = recipe
        _name = State(initialValue: recipe.wrappedValue.name)
        _ingredients = State(initialValue: recipe.wrappedValue.ingredients)
        _cookingTime = State(initialValue: String(recipe.wrappedValue.cookingTime))
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Recipe Name", text: $name)
                        .padding(.vertical, 8)
                    
                    TextField("Ingredients", text: $ingredients, axis: .vertical)
                        .lineLimit(4...8)
                        .padding(.vertical, 8)
                    
                    TextField("Cooking Time (minutes)", text: $cookingTime)
                        .keyboardType(.numberPad)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Edit Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .padding(8)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        recipe.name = name
                        recipe.ingredients = ingredients
                        recipe.cookingTime = Int(cookingTime) ?? 0
                        dismiss()
                    }
                    .disabled(name.isEmpty || ingredients.isEmpty || cookingTime.isEmpty)
                    .padding(8)
                }
            }
        }
    }
}
