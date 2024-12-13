import 'package:circle/core/constants/constants.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:circle/widgets/custom_button/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../core/dimens/dimens.dart';
import '../../../core/navigator/navigator.dart';
import '../../../widgets/custom_svg/CustomSvg.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_form/custom_text_form.dart';
import '../otp_screen/otp_screen.dart';
import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          showBackArrow: true,
          showToolBar: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Container(
              width: Dimens.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: CustomSvg(
                    assetName: 'logo',
                    width: 135,
                    height: 120,
                  )),
                  SizedBox(
                    height: 64,
                  ),
                  CustomText(
                    title: 'Welcome'.tr(),
                    fontWeight: FontWeight.bold,
                    fontSize: fontR28,
                    fontColor: greyColor,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    title: 'Welcome message'.tr(),
                    fontSize: fontR17,
                    fontColor: greyColor,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    textInputType: TextInputType.phone,
                    hint: 'Phone'.tr(),
                    controller: phoneController,
                    prefix: Icon(
                      CupertinoIcons.phone,
                      color: black,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomButtom(
                    name: 'Login'.tr(),
                    onPressed: () async {
                      String phoneNumber = phoneController.text.trim();
                      if (authProvider.isPhoneValid(phoneNumber)) {
                        NavigatorHandler.push(OtpScreen(
                          phoneNumber: phoneNumber,
                        ));
                      }
                    },
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
