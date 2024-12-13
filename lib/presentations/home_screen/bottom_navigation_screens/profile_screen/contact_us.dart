import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:circle/widgets/custom_svg/CustomSvg.dart';
import 'package:circle/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:circle/widgets/custom_text_form/custom_text_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../widgets/custom_button/custom_button.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController massageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'Contact us'.tr(),
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
                    height: 24,
                  ),
                  Center(
                    child: CustomSvg(
                      assetName: 'conectus',
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    line: false,
                    prefix: CustomSvgIcon(assetName: 'pearson'),
                    hint: 'Name'.tr(),
                    textColors: greyColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    line: false,
                    prefix: CustomSvgIcon(assetName: 'email'),
                    hint: 'Email'.tr(),
                    textColors: greyColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                    controller: titleController,
                    line: false,
                    prefix: CustomSvgIcon(assetName: 'massageTitel'),
                    hint: 'Message Title'.tr(),
                    textColors: greyColor,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 137,
                    child: CustomTextFormField(
                      controller: massageController,
                      line: false,
                      prefix: CustomSvgIcon(assetName: 'massage'),
                      hint: 'Message'.tr(),
                      textColors: greyColor,
                      maxLines: null,
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  CustomButtom(
                    name: 'Send'.tr(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
