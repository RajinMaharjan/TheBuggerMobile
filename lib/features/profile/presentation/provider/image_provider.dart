import 'dart:io';
import 'package:flutter/foundation.dart';

class CustomImageProvider with ChangeNotifier {
  File? _selectedImageFile;

  File? get selectedImageFile => _selectedImageFile;

  void setImage(File? image) {
    _selectedImageFile = image;
    notifyListeners();
  }
}
