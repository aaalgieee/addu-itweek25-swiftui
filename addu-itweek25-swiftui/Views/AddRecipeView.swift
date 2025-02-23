import SwiftUI

struct AddRecipeView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipes: [Recipe]
    
    @State private var name: String = ""
    @State private var ingredients: String = ""
    @State private var cookingTime: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Recipe Name", text: $name)
                
                TextField("Ingredients", text: $ingredients, axis: .vertical)
                    .lineLimit(4...8)
                
                TextField("Cooking Time (minutes)", text: $cookingTime)
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let recipe = Recipe(
                            name: name,
                            ingredients: ingredients,
                            cookingTime: Int(cookingTime) ?? 0
                        )
                        recipes.append(recipe)
                        dismiss()
                    }
                    .disabled(name.isEmpty || ingredients.isEmpty || cookingTime.isEmpty)
                }
            }
        }
    }
}
