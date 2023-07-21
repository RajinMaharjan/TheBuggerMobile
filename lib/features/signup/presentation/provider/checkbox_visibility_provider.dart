import 'package:flutter/material.dart';

class CheckBoxVisibilityProvider with ChangeNotifier {
  bool _value = false;
  bool get value => _value;
  bool _showError = false;
  bool get showError => _showError;
  bool _esewaValue = false;
  bool get esewaValue => _esewaValue;
  bool _showEsewaError = false;
  bool get showEsewaError => _showEsewaError;
  bool _paymentCardValue = false;
  bool get paymentCardValue => _paymentCardValue;
  bool _showPaymentCardError = false;
  bool get showPaymentCardError => _showPaymentCardError;

  void toggleCheckBox() {
    _value = !value;
    _showError = false;
    notifyListeners();
  }

  void toggleEsewaCheckBox() {
    _esewaValue = !esewaValue;
    _showEsewaError = false;
    notifyListeners();
  }

  void togglePaymentCardCheckBox() {
    _paymentCardValue = !paymentCardValue;
    _showPaymentCardError = false;
    notifyListeners();
  }

  void uncheckEsewaCheckBox() {
    _esewaValue = false;
    _showEsewaError = false;
    notifyListeners();
  }

  void uncheckPaymentCardCheckBox() {
    _paymentCardValue = false;
    _showPaymentCardError = false;
    notifyListeners();
  }

  void showErrors() {
    _showError = true;
    _showEsewaError = true;
    _showPaymentCardError = true;
    notifyListeners();
  }

  void hideErrors() {
    _showError = false;
    _showEsewaError = false;
    _showPaymentCardError = false;
    notifyListeners();
  }
}
