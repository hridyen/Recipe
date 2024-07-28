import 'package:flutter/material.dart';
import 'package:recipe_app/screens/all_recipe.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      height: h * .06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Slightly rounded corners
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Subtle shadow
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: TextField(
        controller: search,
        style: TextStyle(
          fontSize: w * .04, // Adjusted font size for a minimalist look
          color: Colors.black87, // Slightly lighter color for text
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "What's cooking in your mind...?",
          hintStyle: TextStyle(
            color: Colors.grey[600], // Softer hint text color
            fontSize: w * .04,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>AllRecipe(recipe: search.text)));
            },

            child: Icon(
              Icons.search,
              color: Colors.teal[300], // Teal color for the icon
              size: w * .06, // Slightly smaller icon for minimalism
            ),
          ),
        ),
      ),
    );
  }
}
