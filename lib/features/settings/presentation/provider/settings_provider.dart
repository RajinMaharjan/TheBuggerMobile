import '../../widgets.dart';

class SettingsProvider with ChangeNotifier {
  final Uri privacyPolicyUrl =
      Uri.parse('https://policies.google.com/privacy?hl=en-US');
  final Uri accessibilityUrl =
      Uri.parse('https://www.google.com/accessibility/');
  final Uri termsOfServiceUrl =
      Uri.parse('https://policies.google.com/terms?hl=en-US');
  bool _allowNotifications = true;
  bool _allowSound = true;
  bool _allowVibration = true;
  bool get allowNotifications => _allowNotifications;
  bool get allowSound => _allowSound;
  bool get allowVibration => _allowVibration;

  Future<void> launchPrivacyPolicyInBrowser(Uri privacyPolicyUrl) async {
    if (!await launchUrl(
      privacyPolicyUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $privacyPolicyUrl');
    }
  }

  Future<void> launchAccessibilityInBrowser(Uri accessibilityUrl) async {
    if (!await launchUrl(
      accessibilityUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $accessibilityUrl');
    }
  }

  Future<void> launchTermsOfServiceInBrowser(Uri termsOfServiceUrl) async {
    if (!await launchUrl(
      termsOfServiceUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $termsOfServiceUrl');
    }
  }

  void setAllowNotifications(bool value) {
    _allowNotifications = value;
    notifyListeners();
  }

  void setAllowSound(bool value) {
    _allowSound = value;
    notifyListeners();
  }

  void setAllowVibration(bool value) {
    _allowVibration = value;
    notifyListeners();
  }
}
