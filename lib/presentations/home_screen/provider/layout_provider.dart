import 'package:flutter/material.dart';

import '../bottom_navigation_screens/category_screen/category_screen.dart';
import '../bottom_navigation_screens/home_screen/home_screen.dart';
import '../bottom_navigation_screens/profile_screen/profile_screen.dart';

class LayoutProvider with ChangeNotifier {
  int currentIndex = 0;
  List<Widget> bottomNavigationScreen = [
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen()
  ];

  void init() {
    currentIndex = 0;
  }

  void updateSelectedBottomNavigationIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
