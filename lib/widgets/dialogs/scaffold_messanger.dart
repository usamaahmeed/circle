import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../main.dart';
import '../../core/constants/constants.dart';
import '../custom_text/custom_text.dart';

class CustomScaffoldMessanger {
  static void showScaffoledMessanger({
    required String title,
    Color? bg,
    Color? fontColor,
  }) {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
      content: CustomText(
        title: title,
        fontColor: fontColor ?? white,
        fontSize: fontR14,
      ),
      backgroundColor: bg ?? mainColor,
    ));
  }

  static void showToast(
      {required String title,
      Color? bg,
      Color? fontColor,
      ToastGravity gravity = ToastGravity.TOP}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: title,
        backgroundColor: bg,
        textColor: fontColor,
        gravity: gravity);
  }
}
