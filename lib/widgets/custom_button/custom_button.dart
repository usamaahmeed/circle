import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/core/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CustomButtom({
    super.key,
    required this.name,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: AppTextStyles().normalText().textColorNormal(white),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: bottomColor,
          fixedSize: Size(Dimens.width, 53),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
