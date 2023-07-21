import 'package:qa_lint/core/utils/constants/exports.dart';

class SocialMediaProvider with ChangeNotifier {
  bool isEditing = true;
  void saveData() {
    isEditing = false;
    notifyListeners();
  }

  void editData() {
    isEditing = true;
    notifyListeners();
  }
}
