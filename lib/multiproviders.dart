import 'package:circle/presentations/auth/login_screen/provider/loginProvider.dart';
import 'package:circle/presentations/auth/provider/auth_provider.dart';
import 'package:circle/presentations/auth/provider/count_provider.dart';
import 'package:circle/presentations/auth/sign_up/provider/signupProvider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/category_screen/provider/product_provider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/category_provider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/last_product_provider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/slider_provider.dart';
import 'package:circle/presentations/home_screen/bottom_navigation_screens/home_screen/provider/user_provider.dart';
import 'package:circle/presentations/home_screen/provider/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injection.dart';

class GenerateMultiProviders extends StatelessWidget {
  final Widget child;

  const GenerateMultiProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CountdownProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<LayoutProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<SignUpProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<UserProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<SliderProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<CategoryProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<LastProductProvider>()),
        ChangeNotifierProvider(create: (_) => getIt<ProductProvider>()),
      ],
      child: child,
    );
  }
}
