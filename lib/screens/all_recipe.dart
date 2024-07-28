import 'package:flutter/material.dart';
import 'package:recipe_app/components/custom_app_bar.dart';
import 'package:recipe_app/constants/constant_function.dart';
import 'package:recipe_app/screens/detail_screen.dart';

class AllRecipe extends StatelessWidget {
  final String recipe;
  const AllRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: recipe,back: true,),
      backgroundColor: Colors.grey[100], // Light grey background
      body: FutureBuilder(
        future: ConstantFunction.getResponse(recipe),
        builder: (context, snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
          }
       else   if (!snapshot.hasData) {
            return const Center(child: Text('Oops! Something went wrong', style: TextStyle(color: Colors.grey)));
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: w * .03, vertical: h * .02),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: w * .02,
                crossAxisSpacing: w * .02,
                childAspectRatio: .6 / 1,
              ),
              itemBuilder: (context, index) {
                Map<String, dynamic> snap = snapshot.data![index];
                int time = snap['totalTime'].toInt();

                return Container(
                  margin: EdgeInsets.all(w * .01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>DetailScreen(item: snap )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300], // Light grey fallback color
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: NetworkImage(snap['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding:const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  color: Colors.teal, // Teal background
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    "${time.toString()} min",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: w * .03,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(w * .02),
                          child: Text(
                            snap['label'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: w * .04, // Adjusted font size for better readability
                              color: Colors.grey[900], // Dark grey for text
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
