import 'package:circle/core/app_url/app_url.dart';
import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/models/api_response.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/api_error_handler.dart';

class LastProductRepository {
  Future<ApiResponse> getData() async {
    try {
      DioClient client = DioClient();
      var queryParameters = {
        'price': null,
        'alphabetical': null,
      };
      Response response = await client.get(AppUrls.lastProduct,
          queryParameters: queryParameters);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
