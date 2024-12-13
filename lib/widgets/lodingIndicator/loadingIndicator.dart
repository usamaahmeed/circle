import 'package:circle/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;
  final Color? color;
  final double? strokeWidth;

  const LoadingIndicator({super.key, this.size, this.color, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: CircularProgressIndicator(
            color: color ?? mainColor,
            strokeWidth: strokeWidth ?? 4.0,
          ),
        ));
  }
}
