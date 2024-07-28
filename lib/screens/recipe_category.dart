import 'package:flutter/material.dart';
import 'package:recipe_app/components/recipe_category_view.dart';
import 'package:recipe_app/screens/all_recipe.dart';
import '../constants/category_list.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100], // Light grey background for minimalism
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: w * .03, vertical: h * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "More..." Section
              Text(
                'More...',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: w * .045, // Adjusted font size for minimalism
                  color: Colors.teal, // Teal color for emphasis
                ),
              ),
              SizedBox(height: h * .02),

              // Grid of Categories
              GridView.builder(
                itemCount: categoryImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns for grid
                  crossAxisSpacing: w * .02,
                  mainAxisSpacing: h * .02,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllRecipe(recipe: categories[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: h * .1, // Image size for categories
                            width: w * .2,
                            child: Image.asset(categoryImage[index]),
                          ),
                          SizedBox(height: h * .01),
                          Text(
                            categories[index],
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
                },
                shrinkWrap: true, // Important to ensure GridView fits within the scrollable area
                physics:const NeverScrollableScrollPhysics(), // Disable GridView scrolling to allow parent scrolling
              ),
              SizedBox(height: h * .02),
            ],
          ),
        ),
      ),
    );
  }
}
