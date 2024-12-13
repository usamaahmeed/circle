import 'package:circle/injection.dart';
import 'package:circle/widgets/dialogs/scaffold_messanger.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/userModel.dart';
import '../../../../data/repositories/register_repository.dart';
import '../../../home_screen/main_app_layout/main_app_layout.dart';

class SignUpProvider extends ChangeNotifier {
  RegisterRepository registerRepository = getIt();

  Future<void> register(String firstName, String lastName, String phoneCode,
      String phone, String? image) async {
    print('getitnDataApi');
    try {
      ApiResponse response = await registerRepository.register(
          firstName, lastName, phoneCode, phone, image);
      if (response.response != null) {
        if (response.response?.statusCode == 200) {
          print('response=>>${response.response?.data}');
          if (response.response?.data['code'] == 200) {
            UserModel userModel =
                UserModel.fromJson(response.response?.data['data']);

            Preferences preferences = Preferences();
            preferences.saveUser(userModel);
            NavigatorHandler.pushAndRemoveUntil(MainAppLayout());
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
      print('errorSignUp=>>>$e');
    }
  }
}
