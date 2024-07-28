RECIPE APP

Overview:

The Recipe App is a Flutter application that allows users to explore and manage recipes using the Edamam API.
With a focus on providing an intuitive user experience, the app features multiple screens and utilizes Hive for local data storage,
enabling users to search, save, and interact with recipes seamlessly.

Features:

Onboarding Screen: A guided introduction to the app's functionalities.

Search Screen: Find recipes based on specific needs and cravings.

Category Screen: Browse recipes by various categories.

Details Screen: View detailed information about a selected recipe, including:

Save: Save recipes for later access.

Share: Share recipes with others.

Nutritional Content: Check detailed nutritional information.

Unit Conversion: Convert recipe measurements.

Direction Button: Opens the recipe's webpage.

Ingredient List: Add or remove ingredients from the recipe.

Shopping Screen: Manage ingredients added from the details screen and delete them if needed.

Hive Local Storage: Recipes and ingredients are stored locally using Hive for offline access.

Installation:

Clone the Repository:

bash

Copy code

git clone https://github.com/hridyen/recipe-app.git

cd recipe-app

Install Dependencies:

Ensure you have Flutter installed. Run the following command to get the required packages:

bash

Copy code

flutter pub get

Setup Edamam API:

Obtain an API key from Edamam and configure it in your app.

Refer to the Edamam API documentation for integration details.

Run the App:

Launch the app on your emulator or physical device using:

bash

Copy code

flutter run

Usage:

Search for Recipes: Use the search screen to enter keywords and find recipes.

Explore Categories: Navigate to the category screen to view recipes by category.

View Recipe Details: Click on a recipe to see detailed information, including nutritional content and ingredient list.

Manage Ingredients: Add ingredients from the details screen to the shopping screen and manage them as needed.

Contributing:

Contributions are welcome! To contribute

Fork the repository.
Create a feature branch (git checkout -b feature-branch).
Commit your changes (git commit -am 'Add new feature').
Push to the branch (git push origin feature-branch).
Create a new Pull Request.
