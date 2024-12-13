import 'package:circle/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app_colors/app_colors.dart';
import '../../core/text_styles/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextAlign? textAlign;
  final Color? textColors;
  final Color? bgColors;
  final bool? filled;
  final bool autoFoucus;
  final bool onlyRead;
  final bool? line;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.prefix,
    this.suffix,
    this.textInputType = TextInputType.text,
    this.textAlign,
    this.textColors,
    this.bgColors,
    this.filled = false,
    this.autoFoucus = false,
    this.onlyRead = false,
    this.line = true,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        enabled: !onlyRead,
        autofocus: autoFoucus,
        readOnly: onlyRead,
        maxLines: maxLines ?? 1,
        textAlign: textAlign ?? TextAlign.start,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: mainColor,
        keyboardType: textInputType,
        maxLength: textInputType == TextInputType.phone ? 11 : null,
        inputFormatters: textInputType == TextInputType.phone
            ? [FilteringTextInputFormatter.digitsOnly]
            : [],
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles()
              .normalText(fontSize: fontR17)
              .textColorNormal(textColors ?? textColor),
          suffixIcon: suffix,
          prefixIcon: prefix,
          filled: filled,
          fillColor: bgColors,
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 24, maxWidth: 64, minWidth: 45),
          counterText: '',
          border: line == true
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                )
              : null,
          enabledBorder: line == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: inputBoxColor),
                  borderRadius: BorderRadius.circular(12))
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: inputBoxColor,
                  ),
                ),
          focusedBorder: line == true
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: greyColor),
                  borderRadius: BorderRadius.circular(12),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyColor,
                  ),
                ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('bgColors', bgColors));
  }
}
