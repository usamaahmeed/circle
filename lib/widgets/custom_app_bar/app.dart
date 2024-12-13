import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.white),
      toolbarHeight: 0, // No visible toolbar
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(0); // Specify the preferred height
}
