import 'package:circle/data/repositories/login_repository.dart';
import 'package:circle/injection.dart';
import 'package:circle/presentations/auth/sign_up/sign_up.dart';
import 'package:circle/presentations/home_screen/main_app_layout/main_app_layout.dart';
import 'package:circle/widgets/dialogs/scaffold_messanger.dart';
import 'package:flutter/material.dart';

import '../../../../core/navigator/navigator.dart';
import '../../../../core/utils/preferences.dart';
import '../../../../data/models/api_response.dart';
import '../../../../data/models/userModel.dart';

class LoginProvider extends ChangeNotifier {
  LoginRepository loginRepository = getIt();

  Future<void> login(String phoneCode, String phone) async {
    print('getitnDataApi');
    try {
      ApiResponse response = await loginRepository.login(phoneCode, phone);
      if (response.response != null) {
        if (response.response?.statusCode == 200) {
          if (response.response?.data['code'] == 200) {
            UserModel userModel =
                UserModel.fromJson(response.response?.data['data']);
            Preferences preferences = Preferences();
            preferences.saveUser(userModel);
            NavigatorHandler.pushAndRemoveUntil(MainAppLayout());
          } else if (response.response?.data['code'] == 422) {
            NavigatorHandler.push(SignUp(
              phone: phone,
              phoneCode: phoneCode,
            ));
            CustomScaffoldMessanger.showToast(title: 'User not found');
          }
        } else {
          print('ErrorData=>>${response.response?.statusCode}');
        }
      } else {
        print('ErrorData=>>${response.error}');
      }
    } catch (e) {
      print('errorLogin=>>>$e');
    }
  }
}
