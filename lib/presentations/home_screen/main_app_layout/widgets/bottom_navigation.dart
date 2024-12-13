import 'package:circle/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../injection.dart';
import '../../provider/layout_provider.dart';
import 'bottom_navigation_item.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  LayoutProvider provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.init();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: white,
      child: Consumer<LayoutProvider>(
        builder: (context, provider, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomBottomNavigationItem(
                iconName: 'home',
                selectedIconName: 'home2',
                selected: provider.currentIndex == 0,
                index: 0,
              ),
              CustomBottomNavigationItem(
                iconName: 'category',
                selected: provider.currentIndex == 1,
                index: 1,
                selectedIconName: 'category2',
              ),
              CustomBottomNavigationItem(
                iconName: 'settings',
                selected: provider.currentIndex == 2,
                index: 2,
                selectedIconName: 'settings2',
              ),
            ],
          );
        },
      ),
    );
  }
}
