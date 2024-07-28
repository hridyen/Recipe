Recipe App
Overview
The Recipe App is a comprehensive Flutter application that allows users to explore and manage recipes. Utilizing the Edamam API, the app provides recipe data, enabling users to search, save, and interact with recipes efficiently. The app features multiple screens with local data storage using Hive to manage recipes and ingredients.

Features
Onboarding Screen: A user-friendly introduction to the app's features.
Search Screen: Allows users to search for recipes based on their needs and cravings.
Category Screen: Users can browse recipes by selecting from various categories.
Details Screen: Provides detailed information about the selected recipe, including:
Save, Share, Nutritional Content, Unit Conversion, and Direction buttons.
A list of ingredients that can be added or removed.
A direction button to view the recipe's webpage.
Shopping Screen: Displays ingredients added from the Details Screen. Users can delete ingredients from this screen.
Hive Local Storage: Recipes and ingredients are stored locally using Hive for offline access and management.
Installation
Clone the Repository:

bash
Copy code
git clone https://github.com/yourusername/recipe-app.git
cd recipe-app
Install Dependencies:

Make sure you have Flutter installed. Run the following command to get the required packages:

bash
Copy code
flutter pub get
Setup Edamam API:

Obtain an API key from Edamam and add it to your app's configuration. Follow the API documentation for details on integration.

Run the App:

Use the following command to run the app on your emulator or physical device:

bash
Copy code
flutter run
Usage
Search for Recipes: Use the search screen to find recipes based on keywords.
Explore Categories: Navigate to the category screen to view recipes sorted by category.
View Recipe Details: Click on a recipe to see detailed information, including nutritional content and ingredient list.
Manage Ingredients: Add ingredients from the details screen to the shopping screen and manage them there.
Contributing
Contributions are welcome! If you'd like to contribute to the project, please fork the repository and submit a pull request.
