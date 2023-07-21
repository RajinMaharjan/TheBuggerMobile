import 'package:flutter/material.dart';

class SignUpUserDataProvider extends ChangeNotifier {
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  void setUserData(
      String email, String firstName, String lastName, String phoneNumber) {
    this.email = email;
    this.firstName = firstName;
    this.lastName = lastName;
    this.phoneNumber = phoneNumber;
    notifyListeners();
  }
}
