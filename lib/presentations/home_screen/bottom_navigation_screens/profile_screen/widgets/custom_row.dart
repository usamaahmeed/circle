import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/app_colors/app_colors.dart';
import '../../../../../widgets/custom_svg/CustomSvgIcon.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class CustomProfileRow extends StatelessWidget {
  final String iconName;
  final String text;
  final VoidCallback onTap;
  const CustomProfileRow({
    super.key,
    required this.iconName,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            padding: const EdgeInsets.all(8),
            child: CustomSvgIcon(
              assetName: '$iconName',
            ),
          ),
          CustomText(
            title: '$text'.tr(),
          ),
          Spacer(),
          context.locale.languageCode == 'ar'
              ? Icon(
                  CupertinoIcons.chevron_back,
                  color: textColor,
                  size: 20,
                )
              : Icon(
                  CupertinoIcons.chevron_forward,
                  color: textColor,
                  size: 20,
                ),
        ],
      ),
    );
  }
}
