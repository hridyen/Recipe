import 'package:flutter/material.dart';
import 'package:recipe_app/constants/images_path.dart';

import '../components/home_app_bar.dart';
import '../components/tab_bar_widget.dart';
import '../components/text_field_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeAppBar(),
                SizedBox(
                  height: h * .022,
                ),
                TextFieldWidget(),
                SizedBox(
                  height: h * .022,
                ),
                Container(
                  height: h * .25,
                  width: w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.onBoardingTitle),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: h * .023,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: w * .045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Clickable "see all" text
                    InkWell(
                      onTap: () {
                        // Add your action here, e.g., navigate to a new screen
                        print('See all tapped!');
                      },
                      child: Text(
                        'see all',
                        style: TextStyle(
                          fontSize: w * .04,
                          color: Colors.teal[300], // Teal color
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * .022,
                ),
                const TabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}