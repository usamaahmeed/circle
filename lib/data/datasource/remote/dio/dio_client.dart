import 'dart:io';

import 'package:circle/data/models/userModel.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/app_url/app_url.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../injection.dart';
import '../../../../main.dart';
import 'logging_interceptor.dart';

class DioClient {
  final LoggingInterceptor loggingInterceptor = getIt();
  final SharedPreferences sharedPreferences = getIt();
  late Dio dio;

  DioClient() {
    dio = Dio();
    dio
      ..options.baseUrl = AppUrls.baseUrlApi
      ..options.connectTimeout = const Duration(minutes: 5)
      ..options.receiveTimeout = const Duration(minutes: 5)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'lang': navigatorKey.currentContext!.locale.languageCode
      };
    dio.interceptors.add(loggingInterceptor);
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Preferences preferences = Preferences();
      UserModel? model = await preferences.getUser();
      if (model != null) {
        dio.options.headers['Authorization'] = model.auth.token;
      }
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    FormData? formData,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Preferences preferences = Preferences();
      UserModel? model = await preferences.getUser();
      if (model != null) {
        dio.options.headers['Authorization'] = model.auth.token;
      }
      var data = queryParameters ?? {};
      var response =
          await dio.post(uri, data: formData ?? FormData.fromMap(data));
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
