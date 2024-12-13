import 'package:circle/core/app_colors/app_colors.dart';
import 'package:circle/core/dimens/dimens.dart';
import 'package:circle/core/navigator/navigator.dart';
import 'package:circle/core/utils/preferences.dart';
import 'package:circle/presentations/home_screen/main_app_layout/main_app_layout.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../auth/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    Preferences preferences = Preferences();
    var user = await preferences.getUser();
    Future.delayed(Duration(milliseconds: 1500), () {
      if (user != null) {
        NavigatorHandler.pushAndRemoveUntil(MainAppLayout());
      } else {
        NavigatorHandler.pushAndRemoveUntil(LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(),
      body: SvgPicture.asset(
        'assets/images/svg/splash (1).svg',
        width: Dimens.width,
      ),
    );
  }
}
