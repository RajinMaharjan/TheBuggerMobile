import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';

class ConnectivityUtils {
  late Connectivity _connectivity;
  bool isConnected = true;
  bool _isConnected = true;
  bool _showNoInternetText = false;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  VoidCallback? _onConnectivityChanged;

  // Initialize connectivity check and subscription
  void initConnectivity(
      BuildContext context, VoidCallback onConnectivityChanged) {
    _onConnectivityChanged = onConnectivityChanged;
    _connectivity = Connectivity();
    _checkConnectivity(context);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectivityStatus(context, result);
    });
  }

  // Check connectivity status
  Future<void> _checkConnectivity(BuildContext context) async {
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    // ignore: use_build_context_synchronously
    _updateConnectivityStatus(context, result);
  }

  // Update connectivity status and show/hide no internet text
  void _updateConnectivityStatus(
      BuildContext context, ConnectivityResult result) {
    _isConnected = result != ConnectivityResult.none;
    _showNoInternetText = !_isConnected;
    if (_showNoInternetText) {
      _showNoInternetSnackbar(context);
    }
    isConnected = _isConnected;
    if (_onConnectivityChanged != null) {
      _onConnectivityChanged!();
    }
  }

  // Show a snackbar when there is no internet connection
  void _showNoInternetSnackbar(BuildContext context) {
    const snackBar = SnackBar(content: Text('No Internet Connection'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool> checkConnectivity() async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  // Example button onPressed handler
  void handleButtonPressed(BuildContext context, String routeName) async {
    bool isConnected = await checkConnectivity();
    if (isConnected) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, routeName);
    } else {
      // Show a message indicating no internet connection
      // For example:
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Please check your internet connection.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Dispose of the connectivity subscription
  void disposeConnectivity() {
    _connectivitySubscription.cancel();
  }
}
