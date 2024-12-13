import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_button/custom_button.dart';
import '../../../../widgets/custom_svg/CustomSvg.dart';
import '../../../../widgets/custom_text_form/custom_text_form.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        title: 'Edit account'.tr(),
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
              child: CustomButtom(
                name: 'Confirm'.tr(),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
