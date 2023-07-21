import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionStates extends ChangeNotifier {
  bool _hasInternet = false;

  bool get hasInternet => _hasInternet;

  set hasInternet(bool value) {
    _hasInternet = value;
    notifyListeners();
  }
}

class InternetConnectionProvider with ChangeNotifier {
  InternetConnectionStatus _connectionStatus =
      InternetConnectionStatus.disconnected;

  InternetConnectionStatus get connectionStatus => _connectionStatus;

  void updateConnectionStatus(InternetConnectionStatus status) {
    if (_connectionStatus != status) {
      _connectionStatus = status;
      notifyListeners();
    }
  }
}
