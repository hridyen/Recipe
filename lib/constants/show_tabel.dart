import 'package:flutter/material.dart';

class ShowTable {
  static Future showTable(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2), // Light border for minimalist look
              width: 1,
            ),
          ),
          backgroundColor: Colors.white, // White background for simplicity
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: h * 0.02),
              child: Text(
                "Unit Conversion Chart",
                style: TextStyle(
                  color: Colors.grey[900], // Dark grey text
                  fontWeight: FontWeight.bold,
                  fontSize: w * 0.05,
                ),
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Table(
                  border: TableBorder.all(
                    color: Colors.grey.withOpacity(0.2), // Light border
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  columnWidths: {
                    0: FractionColumnWidth(0.2),
                    1: FractionColumnWidth(0.2),
                    2: FractionColumnWidth(0.2),
                    3: FractionColumnWidth(0.2),
                    4: FractionColumnWidth(0.2),
                  },
                  children: const [
                    TableRow(
                      children: [
                        BuildTableCell(text1: 'CUP', text2: '(cup)'),
                        BuildTableCell(text1: 'OUNCE', text2: '(oz)'),
                        BuildTableCell(text1: 'TABLE', text2: '(SPOON)', text3: '(tbsp)'),
                        BuildTableCell(text1: 'TEA', text2: 'SPOON', text3: '(tsp)'),
                        BuildTableCell(text1: 'MILLI', text2: 'LITRE', text3: '(ml)'),
                      ],
                    ),
                    TableRow(
                      children: [
                        BuildTableCell(text1: '1', text2: 'cup'),
                        BuildTableCell(text1: '8', text2: 'oz'),
                        BuildTableCell(text1: '16', text2: 'tbsp'),
                        BuildTableCell(text1: '48', text2: 'tsp'),
                        BuildTableCell(text1: '237', text2: 'ml'),
                      ],
                    ),
                    TableRow(
                      children: [
                        BuildTableCell(text1: '1/8', text2: 'cup'),
                        BuildTableCell(text1: '1', text2: 'oz'),
                        BuildTableCell(text1: '2', text2: 'tbsp'),
                        BuildTableCell(text1: '6', text2: 'tsp'),
                        BuildTableCell(text1: '30', text2: 'ml'),
                      ],
                    ),
                    TableRow(
                      children: [
                        BuildTableCell(text1: '1/16', text2: 'cup'),
                        BuildTableCell(text1: '0.5', text2: 'oz'),
                        BuildTableCell(text1: '1', text2: 'tbsp'),
                        BuildTableCell(text1: '3', text2: 'tsp'),
                        BuildTableCell(text1: '15', text2: 'ml'),
                      ],
                    ),
                    TableRow(
                      children: [
                        BuildTableCell(text1: '1/48', text2: 'cup'),
                        BuildTableCell(text1: '0.16', text2: 'oz'),
                        BuildTableCell(text1: '1/3', text2: 'tbsp'),
                        BuildTableCell(text1: '1', text2: 'tsp'),
                        BuildTableCell(text1: '5', text2: 'ml'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: h * 0.02), // Space between tables
                Center(
                  child: Text(
                    'Weight Chart',
                    style: TextStyle(
                      color: Colors.grey[900], // Dark grey text
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.05,
                    ),
                  ),
                ),
                SizedBox(height: h * 0.02), // Space between title and table
                Table(
                  border: TableBorder.all(
                    color: Colors.grey.withOpacity(0.2), // Light border
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                  columnWidths: {
                    0: FractionColumnWidth(0.25),
                    1: FractionColumnWidth(0.25),
                    2: FractionColumnWidth(0.25),
                    3: FractionColumnWidth(0.25),
                  },
                  children: const [
                    TableRow(
                      children: [
                        BuildTableCell(text1: '1000', text2: 'gram'),
                        BuildTableCell(text1: '1', text2: 'Kg'),
                        BuildTableCell(text1: '2.2', text2: 'Pound'),
                        BuildTableCell(text1: '35.74', text2: 'Ounce'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BuildTableCell extends StatelessWidget {
  final String text1, text2;
  final String? text3;

  const BuildTableCell({
    super.key,
    required this.text1,
    required this.text2,
    this.text3,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return TableCell(
      child: Container(
        color: Colors.grey[200], // Light grey background
        width: w * 0.2, // Adjust width to fit content
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text1, style: TextStyle(fontSize: 12, color: Colors.grey[800])), // Dark grey text
            Text(text2, style: TextStyle(fontSize: 12, color: Colors.grey[800])),
            if (text3 != null) Text(text3!, style: TextStyle(fontSize: 10, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
