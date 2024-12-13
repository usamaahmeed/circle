import 'package:circle/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../../../widgets/custom_svg/CustomSvgIcon.dart';
import '../../provider/layout_provider.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final String iconName;
  final bool selected;
  final String selectedIconName;
  final int index;

  const CustomBottomNavigationItem(
      {super.key,
      required this.iconName,
      required this.selected,
      required this.index,
      required this.selectedIconName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        LayoutProvider layoutProvider = getIt();
        layoutProvider.updateSelectedBottomNavigationIndex(index);
      },
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: CustomSvgIcon(
        assetName: iconName,
        color: selected ? bottomColor : Colors.black,
      ),
    ));
  }
}
