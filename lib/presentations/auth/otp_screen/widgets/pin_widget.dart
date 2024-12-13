import 'package:circle/core/dimens/dimens.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/text_styles/text_styles.dart';

class PinCodeWidget extends StatelessWidget {
  final Function(String) textSubmit;
  final TextEditingController? controller;
  final int? pinLength;
  final FocusNode? focus;
  final double? pinBoxWidth;

  const PinCodeWidget({
    super.key,
    this.controller,
    this.pinLength,
    this.focus,
    this.pinBoxWidth,
    required this.textSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PinCodeTextField(
        autofocus: true,
        highlight: true,
        focusNode: focus,
        controller: controller,
        maxLength: pinLength!,
        pinBoxHeight: Dimens.width * 0.12,
        pinBoxWidth: pinBoxWidth ?? Dimens.width * 0.12,
        pinBoxRadius: 8.0,
        pinBoxBorderWidth: 1.5,
        wrapAlignment: WrapAlignment.center,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
        keyboardType: TextInputType.number,
        pinTextStyle: AppTextStyles()
            .normalText(
              fontSize: fontR14,
            )
            .textColorBold(bottomColor),
        onTextChanged: (text) {},
        defaultBorderColor: inputBoxColor,
        hasTextBorderColor: inputBoxColor,
        highlightColor: inputBoxColor,
        pinBoxDecoration: ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
        onDone: (text) => textSubmit(text),
      ),
    );
  }
}
