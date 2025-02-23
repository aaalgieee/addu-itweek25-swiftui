# Recipe Book App Demo

A simple iOS Recipe Book app built with SwiftUI to demonstrate basic CRUD (Create, Read, Update, Delete) operations.

## Features

- 📝 Create new recipes with name, ingredients, and cooking time
- 📖 View all recipes in a list
- 🔍 View detailed information for each recipe
- ✏️ Edit existing recipes
- 🗑️ Delete recipes with swipe-to-delete

## App Structure

### Views

1. **ContentView**: Main view showing the list of recipes
   - Navigation title "Recipe Book"
   - Add button (+) in the toolbar
   - Swipe-to-delete functionality

2. **AddRecipeView**: Form to add new recipes
   - Recipe name field
   - Ingredients field (multi-line)
   - Cooking time field (in minutes)
   - Save/Cancel buttons

3. **RecipeDetailView**: Shows detailed recipe information
   - Recipe name
   - Ingredients list
   - Cooking time
   - Edit button

4. **EditRecipeView**: Form to modify existing recipes
   - Pre-filled fields with current recipe data
   - Same layout as AddRecipeView
   - Save/Cancel buttons

### Model

- **Recipe**: Data structure containing:
  - Unique identifier (UUID)
  - Name (String)
  - Ingredients (String)
  - Cooking time (Integer, in minutes)

## How to Use

1. **Adding a Recipe**:
   - Tap the + button in the top-right corner
   - Fill in the recipe details
   - Tap "Add" to save

2. **Viewing Recipe Details**:
   - Tap any recipe in the list
   - View all recipe information

3. **Editing a Recipe**:
   - Open recipe details
   - Tap "Edit" button
   - Modify the details
   - Tap "Save"

4. **Deleting a Recipe**:
   - Swipe left on any recipe in the list
   - Tap "Delete"

## Implementation Details

- Built with SwiftUI
- Uses @State for local data management
- Implements NavigationStack for navigation
- Uses Form views for data input
- Demonstrates binding and state management

## Learning Points

- SwiftUI view structure
- State management (@State, @Binding)
- Navigation in SwiftUI
- Form handling and validation
- CRUD operations in SwiftUI
- List and data management

## Requirements

- iOS 15.0 or later
- Xcode 13.0 or later
- Swift 5.5 or later

## Note

This is a demo app for learning purposes. Data is stored in memory and will be lost when the app is closed. For a production app, you would want to add data persistence using CoreData, UserDefaults, or a similar storage solution.
