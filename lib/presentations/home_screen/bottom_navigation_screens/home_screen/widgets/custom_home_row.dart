import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class CustomHomeRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomHomeRow({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          title: '$title'.tr(),
          fontColor: textColor,
          fontSize: fontR18,
          fontWeight: FontWeight.bold,
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              CustomText(
                title: 'View all'.tr(),
                fontColor: bottomColor,
                fontSize: fontR14,
              ),
              context.locale.languageCode == 'ar'
                  ? Icon(
                      CupertinoIcons.chevron_back,
                      size: 15,
                      color: bottomColor,
                    )
                  : Icon(
                      CupertinoIcons.chevron_forward,
                      size: 15,
                      color: bottomColor,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
