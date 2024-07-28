import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IngredientItem extends StatelessWidget {
  final String quantity, measure, food, imageUrl;
  const IngredientItem({super.key, required this.quantity, required this.measure, required this.food, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    var myBox = Hive.box('shopping');

    return Container(
      margin: EdgeInsets.symmetric(vertical: h * .01, horizontal: w * .033),
      padding: EdgeInsets.all(h * .01),
      decoration: BoxDecoration(
        color: Colors.grey[50], // Light grey background for minimalism
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: w * .2,
              height: h * .1,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: w * .03),
          Expanded(
            child: Text(
              "$food\n$quantity $measure",
              style: TextStyle(
                fontSize: w * .04,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                letterSpacing: 1,
              ),
            ),
          ),
          SizedBox(width: w * .03),
          ValueListenableBuilder(
            valueListenable: myBox.listenable(),
            builder: (context, box, _) {
              bool exist = box.containsKey(food);
              return GestureDetector(
                onTap: () {
                  if (exist) {
                    myBox.delete(food);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item removed')),
                    );
                  } else {
                    String value = '$food $measure $quantity';
                    myBox.put(food, value);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item added successfully')),
                    );
                  }
                },
                child: Icon(
                  exist ? Icons.check_circle : Icons.add_circle_outline,
                  size: w * .07,
                  color: exist ? Colors.teal : Colors.grey[600], // Consistent colors
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
