import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/models/api_response.dart';
import 'package:dio/dio.dart';

import '../../core/app_url/app_url.dart';
import '../datasource/remote/exception/api_error_handler.dart';

class RegisterRepository {
  Future<ApiResponse> register(
    String firstName,
    String lastName,
    String phoneCode,
    String phone,
    String? image,
  ) async {
    MultipartFile? imagePart;
    if (image != null) {
      imagePart = await MultipartFile.fromFile(image);
    }
    try {
      DioClient client = DioClient();
      var fromData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'phone_code': phoneCode,
        'phone': phone,
        'image': imagePart,
        'city_id': 2,
      });
      Response response =
          await client.post(AppUrls.register, formData: fromData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
