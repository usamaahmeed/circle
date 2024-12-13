import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/presentations/auth/sign_up/provider/signupProvider.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/dimens/dimens.dart';
import '../../../injection.dart';
import '../../../widgets/custom_button/custom_button.dart';
import '../../../widgets/custom_svg/CustomSvg.dart';
import '../../../widgets/custom_text_form/custom_text_form.dart';

class SignUp extends StatefulWidget {
  final String phone;
  final String phoneCode;

  const SignUp({super.key, required this.phone, required this.phoneCode});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  SignUpProvider signUpProvider = getIt();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(
          title: 'Sign Up'.tr(),
          showBackArrow: true,
          showToolBar: true,
        ),
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: Dimens.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: CustomSvg(
                        assetName: 'Frame 162',
                        width: 124,
                        height: 124,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 168,
                            child: CustomTextFormField(
                              textAlign: TextAlign.center,
                              textInputType: TextInputType.text,
                              hint: 'first name'.tr(),
                              controller: firstNameController,
                            )),
                        Container(
                            width: 168,
                            child: CustomTextFormField(
                              textAlign: TextAlign.center,
                              textInputType: TextInputType.text,
                              hint: 'last name'.tr(),
                              controller: secondNameController,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:
                    Consumer<SignUpProvider>(builder: (context, provider, _) {
                  return CustomButtom(
                    name: 'Confirm'.tr(),
                    onPressed: () {
                      signUpProvider.register(
                          firstNameController.text,
                          secondNameController.text,
                          widget.phoneCode,
                          widget.phone,
                          null);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
