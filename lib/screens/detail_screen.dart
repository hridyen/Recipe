import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipe_app/components/circle_button.dart';
import 'package:recipe_app/components/custom_clip_path.dart';
import 'package:recipe_app/components/ingredient_list.dart';
import 'package:recipe_app/constants/share.dart';
import 'package:recipe_app/constants/show_detail_dialog.dart';
import 'package:recipe_app/constants/show_tabel.dart';
import 'package:recipe_app/constants/start_cooking.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var myBox=Hive.box('saved');
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    String time = widget.item['totalTime'].toString();
    List<dynamic> ingredients = widget.item['ingredients'] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey[200], // Minimalistic grey background
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * .44,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.item['image']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: h * .04,
                  left: w * 0.02,
                  child: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.item['label'],
                    style: TextStyle(
                      fontSize: w * .05,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[900],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "$time min",
                    style: TextStyle(
                      fontSize: w * .04,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: h * .02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ShareRecipe.share(widget.item['url']);
                        },
                        child: const CircleButton(
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ShowDialog.showCalories(widget.item['totalNutrients'], context);
                        },
                        child: const CircleButton(
                          icon: Icons.monitor_heart_outlined,
                          label: 'Nutrients',
                        ),
                      ),
                      ValueListenableBuilder(valueListenable: myBox.listenable(), builder: (context,box,_){
                       String key=widget.item['label'];
                        bool saved=myBox.containsKey(key);
                       if(saved){
                         return     GestureDetector(
                           onTap: ()
                           {
                             myBox.delete(key);
                             ScaffoldMessenger.of(context).showSnackBar(
                           const    SnackBar(
                               duration: Duration(seconds: 1),
                               content: Text('Recipe deleted'))
                             );
                           },
                           child:const CircleButton(
                             icon: Icons.bookmark,
                             label: 'Save',
                           ),
                         );

                       }
                       else{
                         return    GestureDetector(
                           onTap: (){
                             myBox.put(key,key);
                             ScaffoldMessenger.of(context).showSnackBar(
                                 const    SnackBar(
                                   duration: Duration(seconds: 1),
                                     content: Text('Recipe saved'))
                             );
                           },
                           child:const CircleButton(
                             icon: Icons.bookmark,
                             label: 'Save',
                           ),
                         );
                       }
                           
                      }),

                      GestureDetector(
                        onTap: () {
                          ShowTable.showTable(context);
                        },
                        child:const CircleButton(
                          icon: Icons.table_chart_outlined,
                          label: 'Conversion',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Directions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * .06,
                        ),
                      ),
                      SizedBox(
                        width: w * .34,
                        child: ElevatedButton(
                          onPressed: () {
                            StartCooking.startCooking(widget.item['url']);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Start",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * .02),
                  Container(
                    height: h * .07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              color: Colors.teal,
                              child: Center(
                                child: Text(
                                  'Ingredients Required',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: w * .05,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(
                                '${ingredients.length}\nItems',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: w * .04,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: h * .02),
                  // Container height should be adjusted based on the content
                  Container(
                    height: h * .4, // Adjust this height as needed
                    color: Colors.white,
                    child: IngredientList(
                      ingredients: widget.item['ingredients'],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
