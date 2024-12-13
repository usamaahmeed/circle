import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../injection.dart';
import '../../../../widgets/custom_text/custom_text.dart';
import '../../provider/count_provider.dart';

class CountdownTimer extends StatefulWidget {
  final VoidCallback onResend;

  const CountdownTimer({super.key, required this.onResend});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  CountdownProvider countdownProvider = getIt();

  @override
  Widget build(BuildContext context) {
    return Consumer<CountdownProvider>(
      builder: (context, provider, _) {
        final minutes = (provider.start ~/ 60).toString().padLeft(2, '0');
        final seconds = (provider.start % 60).toString().padLeft(2, '0');

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (!provider.isCounting) {
                  widget.onResend();
                }
              },
              child: CustomText(
                title: 'Resend code'.tr(),
                fontColor: provider.isCounting ? greyColor : bottomColor,
              ),
            ),
            CustomText(
              title: '$minutes:$seconds',
              fontColor: textColor,
            ),
          ],
        );
      },
    );
  }
}
