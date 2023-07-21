import 'package:flutter/material.dart';

class LoginUserDataProvider extends ChangeNotifier {
  late String email;

  void setUserData(String email) {
    this.email = email;
    notifyListeners();
  }
}
