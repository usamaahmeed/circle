import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/presentations/home_screen/main_app_layout/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../injection.dart';
import '../provider/layout_provider.dart';

class MainAppLayout extends StatefulWidget {
  const MainAppLayout({super.key});

  @override
  State<MainAppLayout> createState() => _MainAppLayoutState();
}

class _MainAppLayoutState extends State<MainAppLayout> {
  LayoutProvider provider = getIt();
  @override
  void initState() {
    super.initState();
    provider.init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          Expanded(
              child: IndexedStack(
                  index: provider.currentIndex,
                  children: provider.bottomNavigationScreen)),
          Container(
            color: white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: const CustomBottomNavigation(),
          )
        ],
      );
    });
  }
}
