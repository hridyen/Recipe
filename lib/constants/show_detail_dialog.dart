import 'package:flutter/material.dart';

class ShowDialog {
  static Future<void> showCalories(Map<String, dynamic> item, BuildContext context) async {
    int fat = item['FAT']['quantity'].toInt();
    int sfat = item['FASAT']['quantity'].toInt();
    int cholesterol = item['CHOLE']['quantity'].toInt();
    int nA = item['NA']['quantity'].toInt();
    int carbohydrates = item['CHOCDF.net']['quantity'].toInt();
    int sugar = item['SUGAR']['quantity'].toInt();
    int protein = item['PROCNT']['quantity'].toInt();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.teal,
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: Text(
                'Nutritional Value',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          content: Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNutritionalRow('Total Fat', fat.toString()),
                  _buildNutritionalRow('Saturated Fat', sfat.toString()),
                  _buildNutritionalRow('Cholesterol', cholesterol.toString()),
                  _buildNutritionalRow('Sodium', nA.toString()),
                  _buildNutritionalRow('Total Carbohydrate', carbohydrates.toString()),
                  _buildNutritionalRow('Sugar', sugar.toString()),
                  _buildNutritionalRow('Protein', protein.toString()),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildNutritionalRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
