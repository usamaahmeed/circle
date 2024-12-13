import 'package:flutter/material.dart';

class CustomBoxShadow extends StatelessWidget {
  const CustomBoxShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            spreadRadius: -30,
            blurRadius: 30,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
