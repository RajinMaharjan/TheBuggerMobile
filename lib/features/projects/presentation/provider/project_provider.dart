import '../../widgets.dart';

class ProjectProvider with ChangeNotifier {
  String searchQuery = '';
  int currentProjectIndex = 0;
  List<bool> showFullDescriptionList = [];

  void setCurrentProjectIndex(int index) {
    currentProjectIndex = index;
    notifyListeners();
  }

  void toggleFullDescription(int index) {
    if (index >= 0 && index < showFullDescriptionList.length) {
      showFullDescriptionList[index] = !showFullDescriptionList[index];
      notifyListeners();
    }
  }

  void initializeShowFullDescriptionList(int length) {
    showFullDescriptionList = List<bool>.filled(length, false);
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void setSearchQuery(value) {
    searchQuery = value;
    notifyListeners();
  }
}
