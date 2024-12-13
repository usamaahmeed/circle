import 'package:circle/injection.dart';
import 'package:circle/presentations/auth/login_screen/provider/loginProvider.dart';
import 'package:circle/widgets/dialogs/scaffold_messanger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String phoneCode = '+20';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool loadingOtp = false;
  String? verificationId;
  int? resendToken;

  bool isPhoneValid(String phoneNumber) {
    if (phoneNumber.length == 11) {
      return true;
    } else {
      CustomScaffoldMessanger.showToast(title: 'login err'.tr());
      return false;
    }
  }

  void sendSmsCode(String phoneNumber) async {
    String phone = phoneNumber;
    if (phoneNumber.startsWith('0')) {
      phone = phoneNumber.replaceFirst('0', '');
    }

    loadingOtp = true;
    notifyListeners();

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '$phoneCode$phone',
        timeout: const Duration(seconds: 5),
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          loadingOtp = false;
          print('Exception$e');

          notifyListeners();
        },
        codeSent: (String verificationId, int? resendToken) {
          loadingOtp = false;
          this.verificationId = verificationId;
          this.resendToken = resendToken;
          notifyListeners();
          print('onCodeSend=>>>>>>$verificationId');
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print('Error Otp Auth =>>$e');
      notifyListeners();
    }
  }

  Future<void> verifyCode(String smsCode, String phoneNumber) async {
    String phone = phoneNumber;
    if (phoneNumber.startsWith('0')) {
      phone = phoneNumber.replaceFirst('0', '');
    }
    loadingOtp = true;
    notifyListeners();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      await _firebaseAuth.signInWithCredential(credential);
      loadingOtp = false;
      notifyListeners();
      LoginProvider loginProvider = getIt();
      loginProvider.login(phoneCode, phone);
    } catch (e) {
      print('verifyOtp=>>>$e');
      loadingOtp = false;
      CustomScaffoldMessanger.showToast(title: 'invalid otp ');

      notifyListeners();
    }
  }
}
