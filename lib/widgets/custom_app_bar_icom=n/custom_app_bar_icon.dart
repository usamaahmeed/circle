import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';

class CustomAppBarIcon extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final VoidCallback onPressed;
  const CustomAppBarIcon({
    super.key,
    required this.icon,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: inputBoxColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: color ?? black,
      ),
    );
  }
}
