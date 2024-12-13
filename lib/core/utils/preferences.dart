import 'dart:convert';

import 'package:circle/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/sliderModel.dart';
import '../../data/models/userModel.dart';

class Preferences {
  final SharedPreferences sharedPreferences = getIt<SharedPreferences>();

  Future<void> saveUser(UserModel user) async {
    String userJson = jsonEncode(user.toJson());
    await sharedPreferences.setString('user', userJson);
  }

  Future<UserModel?> getUser() async {
    String? userJson = sharedPreferences.getString('user');
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  Future<void> clearUser() async {
    await sharedPreferences.remove('user');
  }

  Future<void> saveLanguage(String language) async {
    await sharedPreferences.setString('language', language);
  }

  Future<String?> getLanguage() async {
    return sharedPreferences.getString('language');
  }

  Future<void> clearLanguage() async {
    await sharedPreferences.remove('language');
  }

  Future<void> saveSliderData(SliderModel data) async {
    String dataJson = jsonEncode(data.toJson());
    await sharedPreferences.setString('sliderData', dataJson);
  }

  Future<SliderModel?> getSliderData() async {
    String? userJson = sharedPreferences.getString('sliderData');
    if (userJson != null) {
      Map<String, dynamic> sliderMap = jsonDecode(userJson);
      return SliderModel.fromJson(sliderMap);
    }
    return null;
  }

  Future<void> clearSliderData() async {
    await sharedPreferences.remove('sliderData');
  }
}
