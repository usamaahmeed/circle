import 'package:circle/injection.dart';
import 'package:circle/presentations/auth/otp_screen/widgets/count_down_timer.dart';
import 'package:circle/presentations/auth/otp_screen/widgets/pin_widget.dart';
import 'package:circle/presentations/auth/provider/count_provider.dart';
import 'package:circle/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:circle/widgets/custom_button/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_colors/app_colors.dart';
import '../../../widgets/custom_svg/CustomSvg.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/lodingIndicator/loadingIndicator.dart';
import '../provider/auth_provider.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthProvider authProvider = getIt();
  CountdownProvider countdownProvider = getIt();
  TextEditingController pinCodeController = TextEditingController();
  FocusNode pinCodeFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    authProvider = getIt<AuthProvider>();
    countdownProvider = getIt<CountdownProvider>();

    WidgetsBinding.instance.addPostFrameCallback((value) {
      authProvider.sendSmsCode(widget.phoneNumber);
      countdownProvider.resetTimer();
      countdownProvider.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            children: [
              CustomSvg(
                assetName: 'otp',
                height: 150,
                width: 225,
              ),
              SizedBox(
                height: 16,
              ),
              CustomText(
                title: 'otp text'.tr(),
                fontColor: textColor,
              ),
              CustomText(
                title: widget.phoneNumber,
                fontColor: textColor,
              ),
              SizedBox(
                height: 16,
              ),
              PinCodeWidget(
                controller: pinCodeController,
                focus: pinCodeFocus,
                pinLength: 6,
                textSubmit: (value) {},
              ),
              SizedBox(
                height: 25,
              ),
              Consumer<AuthProvider>(
                builder: (context, authProvider, _) {
                  if (authProvider.loadingOtp) {
                    return SizedBox();
                  } else {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      countdownProvider.startTimer();
                    });
                    return CountdownTimer(
                      onResend: () {
                        authProvider.sendSmsCode(widget.phoneNumber);
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          countdownProvider.resendCode();
                        });
                      },
                    );
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              Consumer<AuthProvider>(builder: (context, provider, _) {
                return provider.loadingOtp
                    ? LoadingIndicator()
                    : CustomButtom(
                        name: 'Confirm'.tr(),
                        onPressed: () async {
                          await provider.verifyCode(
                              pinCodeController.text, widget.phoneNumber);
                        },
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
