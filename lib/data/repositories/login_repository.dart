import 'package:circle/core/app_url/app_url.dart';
import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/models/api_response.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/api_error_handler.dart';

class LoginRepository {
  Future<ApiResponse> login(String phoneCode, String phone) async {
    try {
      DioClient client = DioClient();
      var formData = FormData.fromMap({
        'phone_code': phoneCode,
        'phone': phone,
      });
      Response response = await client.post(AppUrls.login, formData: formData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
