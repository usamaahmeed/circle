import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../injection.dart';
import '../../../../widgets/custom_button/custom_button.dart';
import '../../../../widgets/custom_text/custom_text.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == 'ar';
    bool isEnglish = context.locale.languageCode == 'en';

    return AlertDialog(
      backgroundColor: white,
      title: CustomText(
        title: 'Language'.tr(),
        fontWeight: FontWeight.bold,
        fontSize: fontR18,
      ),
      content: Container(
        height: 242,
        width: 375,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      checkColor: bottomColor,
                      activeColor: bottomColor,
                      side: BorderSide(
                        color: bottomColor,
                      ),
                      value: isArabic,
                      onChanged: (value) {
                        setState(() {
                          isArabic = true;
                          isEnglish = false;
                        });
                      },
                    ),
                    CustomText(
                      title: 'العربية',
                      fontSize: fontR18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      checkColor: bottomColor,
                      activeColor: bottomColor,
                      side: BorderSide(
                        color: bottomColor,
                      ),
                      value: isEnglish,
                      onChanged: (value) {
                        setState(() {
                          isArabic = false;
                          isEnglish = true;
                        });
                      },
                    ),
                    CustomText(
                      title: 'English',
                      fontSize: fontR18,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButtom(
                  name: 'Confirm'.tr(),
                  onPressed: () async {
                    if (isArabic) {
                      await context.setLocale(Locale('ar'));
                      await getIt<Preferences>().saveLanguage('ar');
                    } else if (isEnglish) {
                      await context.setLocale(Locale('en'));
                      await getIt<Preferences>().saveLanguage('en');
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
