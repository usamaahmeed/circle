import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_svg/CustomSvg.dart';
import '../../../../../widgets/custom_text/custom_text.dart';

class CustomProfileColum extends StatelessWidget {
  final String imageTitle;
  final String title;

  const CustomProfileColum({
    super.key,
    required this.imageTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      child: Column(
        children: [
          Container(
            height: 48,
            width: 48,
            child: CustomSvg(
              assetName: '$imageTitle',
            ),
          ),
          SizedBox(
            height: 12,
          ),
          CustomText(
            title: '$title'.tr(),
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
