import 'dart:async';

import 'package:flutter/material.dart';

class ProgressIndicatorTimerProvider with ChangeNotifier {
  bool _isLoading = false;
  Timer? _progressIndicatorTimer;
  Timer? get progressIndicatorTimer => _progressIndicatorTimer;
  bool get isLoading => _isLoading;

  void startProgressIndicatorTimer() {
    _progressIndicatorTimer = Timer(const Duration(seconds: 30), () {
      _isLoading = false;
      _progressIndicatorTimer = null;
      notifyListeners();
    });
  }

  void stopProgressIndicatorTimer() {
    _progressIndicatorTimer?.cancel();
    _progressIndicatorTimer = null;
  }

  void setIsLoadingTrue() {
    _isLoading = true;
    notifyListeners();
  }

  void setIsLoadingFalse() {
    _isLoading = false;
    notifyListeners();
  }
}
