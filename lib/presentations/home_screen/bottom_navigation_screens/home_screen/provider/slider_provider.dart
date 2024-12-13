import 'package:circle/injection.dart';
import 'package:circle/widgets/dialogs/scaffold_messanger.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/api_response.dart';
import '../../../../../data/models/sliderModel.dart';
import '../../../../../data/repositories/slider_repository.dart';

class SliderProvider extends ChangeNotifier {
  SliderRepository sliderRepositoryRepository = getIt();
  SliderModel? sliderModel;

  Future<void> fetchSliderData() async {
    print('getitnDataApi');
    try {
      ApiResponse response = await sliderRepositoryRepository.getData();
      if (response.response != null) {
        if (response.response?.statusCode == 200) {
          if (response.response?.data['code'] == 200) {
            sliderModel = SliderModel.fromJson(response.response?.data['data']);
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
      print('errorGetSliderData=>>>$e');
    }
  }
}
