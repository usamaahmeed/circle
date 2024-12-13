import 'package:circle/core/utils/preferences.dart';
import 'package:circle/injection.dart';
import 'package:circle/presentations/splash_screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constants/constants.dart';
import 'firebase_options.dart';
import 'multiproviders.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();

  String? savedLanguage = await getIt<Preferences>().getLanguage();
  Locale startLocale =
      savedLanguage != null ? Locale(savedLanguage) : supportedLanguages[0];
  runApp(
    GenerateMultiProviders(
      child: EasyLocalization(
        supportedLocales: supportedLanguages,
        startLocale: startLocale,
        saveLocale: true,
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        fallbackLocale: supportedLanguages[0],
        path: 'assets/languages',
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.locale.languageCode == 'en' ? 'Circles' : 'الدوائر',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const SplashScreen(),
    );
  }
}
