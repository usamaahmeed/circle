import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTextStyles {
  TextStyle normalText({double fontSize = fontR14}) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: 'font_regular',
    );
  }
}

extension TextStyleExtension on TextStyle {
  TextStyle textColorNormal(Color color) =>
      copyWith(color: color, fontFamily: 'font_regular');
  TextStyle textColorBold(Color color) => copyWith(
      color: color, fontFamily: 'font_bold', fontWeight: FontWeight.bold);
}
