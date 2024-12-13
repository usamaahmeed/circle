import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/core/constants/constants.dart';
import 'package:circle/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:circle/widgets/custom_text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/dimens/dimens.dart';
import '../../../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_svg/CustomSvg.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'About the app'.tr(),
        showBackArrow: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              width: Dimens.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: CustomSvg(
                      assetName: 'logo',
                      height: 121,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      CustomSvgIcon(
                        assetName: 'Rectangle 999',
                        height: 33,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomText(
                        title: 'About us'.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: fontR18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomText(
                    fontColor: greyColor,
                    title: 'massa'.tr(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
