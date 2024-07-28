import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipe_app/components/custom_app_bar.dart';
import 'package:recipe_app/components/custom_clip_path.dart';
import 'package:recipe_app/constants/share.dart';
import 'package:recipe_app/screens/home_screen.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('shopping');

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Shopping',
        back: true,
        onBackPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false,
          );
        },
      ),
      body: ValueListenableBuilder(
        valueListenable: myBox.listenable(),
        builder: (context, box, _) {
          var data = box.values.toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * .07,
                width: w,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: w * .03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ingredients Required',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: w * .05,
                      ),
                    ),
                    Text(
                      '${data.length} Items',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: w * .04,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: h * .01, horizontal: w * .03),
                      padding: EdgeInsets.all(h * .01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          data[index],
                          style: TextStyle(
                            fontSize: w * .04,
                            color: Colors.grey[800],
                          ),
                        ),
                        trailing: PopupMenuButton<String>(
                          icon: const Icon(Icons.more_vert, color: Colors.teal),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'share',
                                child: Text('Share', style: TextStyle(color: Colors.teal)),
                              ),
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: Text('Delete', style: TextStyle(color: Colors.red)),
                              ),
                            ];
                          },
                          onSelected: (String value) async {
                            if (value == 'delete') {
                              await deleteItem(index);
                            } else if (value == 'share') {
                              ShareRecipe.share(data[index]);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> deleteItem(int index) async {
    var myBox = Hive.box('shopping');
    await myBox.deleteAt(index);
  }
}
