import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final int SelectedItem;
  final Function(int) onTap;
  const BottomNavBar({super.key, required this.onTap, required this.SelectedItem});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey[100],
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w*.015,vertical:h*.01),
          child: GNav(
            gap: 10,
            tabBorderRadius: 100,
            backgroundColor: Colors.grey[100]!,
            activeColor: Colors.yellow,
            color: Colors.red[600],
            tabBackgroundGradient: LinearGradient(
              colors: [
                Colors.red[400]!,
                Colors.redAccent.shade700
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            iconSize: 30,
            textSize: 18,
            padding: EdgeInsets.symmetric(horizontal: w*.01,
            vertical: h*.01),
            tabs:const [
              GButton(icon: CupertinoIcons.home,text: 'Home',),
              GButton(icon: Icons.category,text: 'Categories',),
            ],
          onTabChange: widget.onTap,
            selectedIndex: 0,
          ),
      ),
    );
  }
}
