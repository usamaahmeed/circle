import 'package:circle/injection.dart';
import 'package:circle/widgets/dialogs/scaffold_messanger.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/api_response.dart';
import '../../../../../data/models/productModel.dart';
import '../../../../../data/repositories/last_product_repo.dart';

class LastProductProvider extends ChangeNotifier {
  LastProductRepository productRepository = getIt();
  List<ProductModel> products = [];

  Future<void> fetchProductData() async {
    print('getitnDataApi');
    try {
      ApiResponse response = await productRepository.getData();
      if (response.response != null) {
        if (response.response?.statusCode == 200) {
          if (response.response?.data['code'] == 200) {
            var data = response.response?.data['data'] as List<dynamic>;
            products = List<ProductModel>.from(
              data.map((item) => ProductModel.fromJson(item)),
            );
            notifyListeners();
          } else if (response.response?.data['code'] == 422) {
            CustomScaffoldMessanger.showToast(
                title: '${response.response?.data['message']}');
          }
        } else {
          print('ErrorData=>>${response.response?.statusCode}');
        }
      } else {
        print('ErrorData=>>${response.error}');
      }
    } catch (e) {
      print('errorGetProduct=>>>$e');
    }
  }
}
