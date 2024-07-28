import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool back;
  final VoidCallback? onBackPressed; // Add a callback for back button press

  const CustomAppBar({
    super.key,
    required this.title,
    required this.back,
    this.onBackPressed, // Accept callback as a parameter
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: w * .05, // Adjusted font size for a minimalist look
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5, // Reduced letter spacing for minimalism
          color: Colors.grey[900], // Dark grey color for text
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey[100], // Minimalistic light grey background
      leading: back
          ? IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.grey[900]), // Dark grey for back icon
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      )
          : null,
      elevation: 0, // Removed shadow for a cleaner look
    );
  }
}
