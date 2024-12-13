import 'package:circle/core/utils/preferences.dart';
import 'package:circle/data/models/userModel.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? user;
  Preferences preferences = Preferences();

  UserModel? get userData => user;

  Future<void> fetchUserData() async {
    user = await preferences.getUser();
    notifyListeners();
  }
}
