import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedItem;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedItem,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white, // Minimalist background color
      padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
      child: GNav(
        gap: 8, // Reduced gap for minimalism
        backgroundColor: Colors.white, // Matches the container background
        color: Colors.grey[600]!, // Subtle color for inactive items
        activeColor: Colors.teal[300]!, // Pastel green for active item
        iconSize: 24, // Smaller icon size for minimalism
        textSize: 14, // Smaller text size
        padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.01),
        tabBorderRadius: 16, // Rounded corners for tabs
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
            iconColor: Colors.grey[600]!, // Minimalist icon color
            backgroundColor: Colors.transparent, // Transparent background for tabs
          ),
          GButton(
            icon: Icons.category,
            text: "Categories",
            iconColor: Colors.grey[600]!,
            backgroundColor: Colors.transparent,
          ),
          GButton(
            icon: Icons.search,
            text: "Search",
            iconColor: Colors.grey[600]!,
            backgroundColor: Colors.transparent,
          ),
          GButton(
            icon: Icons.bookmark,
            text: "Saved",
            iconColor: Colors.grey[600]!,
            backgroundColor: Colors.transparent,
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Shopping",
            iconColor: Colors.grey[600]!,
            backgroundColor: Colors.transparent,
          ),
        ],
        onTabChange: widget.onTap,
        selectedIndex: widget.selectedItem,
      ),
    );
  }
}
