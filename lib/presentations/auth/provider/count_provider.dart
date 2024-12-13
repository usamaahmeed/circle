import 'dart:async';

import 'package:flutter/foundation.dart';

class CountdownProvider with ChangeNotifier {
  Timer? _timer;
  int _start = 60;
  bool _isCounting = false;

  int get start => _start;
  bool get isCounting => _isCounting;

  void startTimer() {
    if (_isCounting) {
      return;
    }

    _isCounting = true;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start > 0) {
        _start--;
        notifyListeners();
      } else {
        _timer?.cancel();
        _isCounting = false;
        notifyListeners();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _isCounting = false;
    notifyListeners();
  }

  void resetTimer() {
    _timer?.cancel();
    _start = 60;
    _isCounting = false;
    notifyListeners();
  }

  void resendCode() {
    resetTimer();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
