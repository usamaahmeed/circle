import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/text_styles/text_styles.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool isStrikethrough;
  const CustomText({
    super.key,
    this.title,
    this.fontColor = Colors.black,
    this.fontSize = fontR14,
    this.fontWeight = FontWeight.normal,
    this.maxLines,
    this.textAlign,
    this.isStrikethrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return fontWeight == FontWeight.normal
        ? Text(
            textAlign: textAlign,
            title ?? '',
            maxLines: maxLines,
            overflow: maxLines != null ? TextOverflow.ellipsis : null,
            style: AppTextStyles()
                .normalText(fontSize: fontSize)
                .copyWith(
                    decoration: isStrikethrough
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)
                .textColorNormal(fontColor),
          )
        : Text(
            textAlign: textAlign,
            title ?? '',
            style: AppTextStyles()
                .normalText(fontSize: fontSize)
                .textColorBold(fontColor),
          );
  }
}
