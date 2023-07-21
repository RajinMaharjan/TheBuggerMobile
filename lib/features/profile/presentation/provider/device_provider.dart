import 'package:qa_lint/features/profile/data/model/mobile_brand_name_model.dart';

import '../widget.dart';

class DeviceProvider with ChangeNotifier {
  int selectedDeviceIndex = 0;
  void setSelectedDeviceIndex(int index) {
    selectedDeviceIndex = index;
    notifyListeners();
  }

  final List<DeviceModel> devices = [
    DeviceModel(
      name: 'PC',
      icon: Icons.laptop,
    ),
    DeviceModel(
      name: 'Mobile Phones',
      icon: Icons.smartphone,
    ),
    DeviceModel(
      name: 'Tablets/Ipad',
      icon: Icons.tablet,
    ),
  ];
  final List<DeviceModel> _selectedDevices = [];
  List<DeviceModel> get selectedDevices => _selectedDevices;

  void addDevice(DeviceModel device) {
    _selectedDevices.add(device);
    notifyListeners();
  }

  void removeDevice(DeviceModel device) {
    _selectedDevices.remove(device);
    notifyListeners();
  }

  void clearDevices() {
    _selectedDevices.clear();
    notifyListeners();
  }

  void removeDeviceByIndex(int index) {
    _selectedDevices.removeAt(index);
    notifyListeners();
  }

// devices search query
  List<String> filteredBrands = [];
  MobileBrands mobileBrands = MobileBrands();
  String selectedBrands = '';

  void matchedBrand(String query) {
    filteredBrands = mobileBrands.mobileBrands
        .where((brand) => brand.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void clearSearch() {
    filteredBrands.clear();
    notifyListeners();
  }
}
