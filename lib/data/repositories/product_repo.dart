import 'package:circle/core/app_url/app_url.dart';
import 'package:circle/data/datasource/remote/dio/dio_client.dart';
import 'package:circle/data/models/api_response.dart';
import 'package:dio/dio.dart';

import '../datasource/remote/exception/api_error_handler.dart';

class ProductRepo {
  Future<ApiResponse> getData(
    String? title,
    int? categoryId,
    int? subCategoryId,
  ) async {
    try {
      DioClient client = DioClient();
      var queryParameters = {
        'title': title,
        'category_id': categoryId,
        'sub_category_id': subCategoryId,
        'price': null,
        'alphabetical': null,
      };
      Response response =
          await client.get(AppUrls.product, queryParameters: queryParameters);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.handleError(e));
    }
  }
}
