import 'package:circle/core/utils/preferences.dart';
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
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repositories/category_repo.dart';
import 'data/repositories/last_product_repo.dart';
import 'data/repositories/login_repository.dart';
import 'data/repositories/product_repo.dart';
import 'data/repositories/register_repository.dart';
import 'data/repositories/slider_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(() => AuthProvider());
  getIt.registerLazySingleton(() => CountdownProvider());
  getIt.registerLazySingleton(() => LayoutProvider());
  getIt.registerLazySingleton(() => LoginProvider());
  getIt.registerLazySingleton(() => SignUpProvider());
  getIt.registerLazySingleton(() => UserProvider());
  getIt.registerLazySingleton(() => SliderProvider());
  getIt.registerLazySingleton(() => CategoryProvider());
  getIt.registerLazySingleton(() => LastProductProvider());
  getIt.registerLazySingleton(() => ProductProvider());

  ///preference
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Preferences());

  ///network
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());

  ///repositories
  getIt.registerLazySingleton(() => LoginRepository());
  getIt.registerLazySingleton(() => RegisterRepository());
  getIt.registerLazySingleton(() => SliderRepository());
  getIt.registerLazySingleton(() => CategoryRepository());
  getIt.registerLazySingleton(() => LastProductRepository());
  getIt.registerLazySingleton(() => ProductRepo());
}
