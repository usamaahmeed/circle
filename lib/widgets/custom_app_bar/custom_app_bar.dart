import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/constants/constants.dart';
import '../../core/dimens/dimens.dart';
import '../custom_text/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? title2;
  final Widget? leading;
  final double? fontSize;
  final double? loadingWidth;
  final Color? fontColor;
  final Color? fontColor2;
  final bool? showBackArrow;
  final List<Widget>? actions;
  final bool showToolBar;
  final bool titleCenter;
  final double? elevation;
  final Color? bgColor;
  final bool? isColum;

  const CustomAppBar({
    super.key,
    this.title,
    this.title2,
    this.fontSize = fontR18,
    this.fontColor = black,
    this.showBackArrow = false,
    this.actions,
    this.showToolBar = false,
    this.titleCenter = false,
    this.elevation,
    this.bgColor,
    this.leading,
    this.isColum = false,
    this.fontColor2 = greyColor,
    this.loadingWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: loadingWidth,
      leading: leading,
      elevation: elevation,
      backgroundColor: bgColor ?? white,
      flexibleSpace: Container(
        color: white,
      ),
      title: isColum == false
          ? CustomText(
              title: title ?? '',
              fontSize: fontSize ?? fontR18,
              fontColor: fontColor ?? textColor,
              fontWeight: FontWeight.bold,
            )
          : Column(
              children: [
                CustomText(
                  title: title2 ?? '',
                  fontSize: fontSize ?? fontR12,
                  fontColor: fontColor2 ?? greyColor,
                ),
                CustomText(
                  title: title ?? '',
                  fontSize: fontSize ?? fontR18,
                  fontColor: fontColor ?? textColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
      automaticallyImplyLeading: showBackArrow ?? false,
      centerTitle: titleCenter,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size(Dimens.width, showToolBar == true ? appBarSize : 0);
}
