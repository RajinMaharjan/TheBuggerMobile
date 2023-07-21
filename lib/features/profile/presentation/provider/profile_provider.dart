import 'package:qa_lint/features/dashboard/presentation/widgets.dart';

class ProfileProvider with ChangeNotifier {
  int selectedIndex = 0;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
