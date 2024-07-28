import 'package:flutter/material.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
  //  final h = MediaQuery.of(context).size.height;

    return  Row(
      children: [
        Text("What are we\n cooking today?", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: w*.07,
          height: 1
        ),),
        const Spacer()
      ],
    );
  }
}
