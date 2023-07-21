import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:qa_lint/features/payment/presentation/pages/payment_page.dart';
import 'package:qa_lint/features/projects/presentation/pages/project_page.dart';
import 'package:qa_lint/features/settings/presentation/pages/settings_page.dart';

class HomePageProvider with ChangeNotifier {
  int _selectedIndex = 0;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  int get getSelectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    isSelected1 = index == 0;
    isSelected2 = index == 1;
    isSelected3 = index == 2;
    isSelected4 = index == 3;
    notifyListeners();
  }

  final List<Widget> pages = [
    const DashBoardPage(),
    const ProjectPage(),
    const PaymentPage(),
    const SettingsPage(),
  ];
  final List<String> appBarTitle = [
    'Dashboard',
    'Project',
    'Billing & payments',
    'Settings',
  ];
}
