


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

class ConnectivityProvider with ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;
  late BuildContext _context;

  bool get isConnected => _isConnected;

  void startMonitoring(BuildContext context) {
    _context = context;
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _isConnected = result != ConnectivityResult.none;
      notifyListeners();

      if (_isConnected) {
        showToast('Internet is connected');
      }
    });
  }

  Future<void> checkConnectivity(BuildContext context) async {
    _context = context;
    final result = await _connectivity.checkConnectivity();
    _isConnected = result != ConnectivityResult.none;
    notifyListeners();
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      textColor: Colors.white,
      backgroundColor: Colors.green,
      msg: message,
      fontSize: isTablet(_context)
          ? mediaQueryHeight(_context) * 0.1
          : defultFontSize(_context),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
