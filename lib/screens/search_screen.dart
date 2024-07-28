import 'package:flutter/material.dart';
import 'package:recipe_app/components/custom_app_bar.dart';
import 'package:recipe_app/components/text_field_widget.dart';
import 'package:recipe_app/constants/search_tags.dart';
import 'package:recipe_app/screens/all_recipe.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Search', back: false),
      backgroundColor: Colors.grey[100], // Light grey background
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: h * .02,
          horizontal: w * .04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextFieldWidget(),
            SizedBox(height: h * .04),
            Text(
              'Search Tags',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: w * .05, // Adjusted font size
                color: Colors.grey[900], // Dark grey for text
              ),
            ),
            SizedBox(height: h * .02),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((label) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllRecipe(recipe: label)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.teal ,
                    backgroundColor: Colors.white,// Teal text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    elevation: 0, // No shadow for a minimalist look
                    side: BorderSide(color: Colors.grey[300]!), // Light grey border
                  ),
                  child: Text(label, style: TextStyle(fontSize: w * .04)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
