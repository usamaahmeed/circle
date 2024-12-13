import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';
import '../custom_text_form/custom_text_form.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final bool onlyRead;
  final bool autoFoucus;

  const CustomSearchField({
    super.key,
    required this.controller,
    this.onlyRead = false,
    this.autoFoucus = false,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      autoFoucus: autoFoucus,
      onlyRead: onlyRead,
      filled: true,
      bgColors: inputBoxColor,
      controller: controller,
      hint: 'search'.tr(),
      textColors: greyColor,
      prefix: Icon(
        Icons.search_outlined,
        color: bottomColor,
      ),
    );
  }
}
