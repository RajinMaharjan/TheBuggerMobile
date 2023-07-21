import 'package:qa_lint/core/utils/constants/exports.dart';

class DeviceModel {
  final String name;
  final IconData icon;
  bool isSelected;

  DeviceModel({
    required this.name,
    required this.icon,
    this.isSelected = false,  
  });
}

