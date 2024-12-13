import 'package:circle/core/constants/constants.dart';
import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/profile_screen/about_us.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/profile_screen/contact_us.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/profile_screen/edit_profile.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/profile_screen/language_alertDialog.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/custom_column.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/profile_screen/widgets/custom_row.dart';
import 'package:circle/widgets/custom_svg/CustomSvg.dart';
import 'package:circle/widgets/custom_svg/CustomSvgIcon.dart';
import 'package:circle/widgets/custom_text/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../widgets/custom_app_bar/custom_app_bar.dart';
import '../../../../widgets/custom_box_shadow/custom_box_shadow.dart';
import '../../../auth/login_screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'More'.tr(),
        elevation: 5,
        bgColor: inputBgDark,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/png/pic.png',
                    height: 96,
                    width: 96,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: CustomText(
                    title: 'أسامه أحمد',
                    fontWeight: FontWeight.bold,
                    fontSize: fontR18,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  height: 121,
                  width: Dimens.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: profileBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      CustomProfileColum(
                        imageTitle: 'talabat',
                        title: 'Orders',
                      ),
                      Spacer(),
                      CustomProfileColum(
                        imageTitle: 'fav',
                        title: 'Favorites',
                      ),
                      Spacer(),
                      CustomProfileColum(
                        imageTitle: 'point',
                        title: 'Points',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: Dimens.width,
                  height: 374,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    color: profileBgColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Settings'.tr(),
                        fontColor: greyColor,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomProfileRow(
                        iconName: 'user-pen 1',
                        text: 'Edit account',
                        onTap: () {
                          NavigatorHandler.push(
                            EditProfile(),
                          );
                        },
                      ),
                      CustomProfileRow(
                        iconName: 'language',
                        text: 'Language',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return LanguageWidget();
                            },
                          );
                        },
                      ),
                      CustomProfileRow(
                        iconName: 'callus',
                        text: 'Contact us',
                        onTap: () {
                          NavigatorHandler.push(
                            ContactScreen(),
                          );
                        },
                      ),
                      CustomProfileRow(
                        iconName: 'about us',
                        text: 'About the app',
                        onTap: () {
                          NavigatorHandler.push(
                            AboutUsScreen(),
                          );
                        },
                      ),
                      CustomProfileRow(
                        iconName: 'App Rating',
                        text: 'App Rating',
                        onTap: () {},
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            padding: const EdgeInsets.all(14),
                            child: CustomSvgIcon(
                              assetName: 'delete',
                            ),
                          ),
                          CustomText(
                            title: 'Delete account'.tr(),
                            fontColor: deleteColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Preferences preferences = Preferences();
                    preferences.clearUser();
                    NavigatorHandler.pushAndRemoveUntil(LoginScreen());
                  },
                  child: Center(
                    child: CustomSvg(
                      assetName: 'logout',
                      height: 48,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomBoxShadow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
