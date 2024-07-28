import 'package:flutter/material.dart';
import 'package:recipe_app/screens/all_recipe.dart';

class RecipeCategoryView extends StatelessWidget {
  final String name, image;
  const RecipeCategoryView({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AllRecipe(recipe: name),
          ),
        );
      },
      child: SizedBox(
        height: h * .1, // Adjusted height for minimalism
        width: w * .2, // Adjusted width to be consistent
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            Container(
              height: h * .08, // Adjusted image height
              width: w * .2, // Adjusted image width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8), // Rounded corners for minimalism
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.1), // Lighter shadow for minimalism
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            SizedBox(height: h * .01), // Reduced spacing between image and text
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800], // Dark grey text color
                fontSize: w * .03, // Adjusted font size for minimalism
              ),
              overflow: TextOverflow.ellipsis, // Ensure text does not overflow
              maxLines: 1, // Limit text to a single line
            ),
          ],
        ),
      ),
    );
  }
}
