import '../../widgets.dart';

class PaymentProvider with ChangeNotifier {
  final Uri esewaUrl = Uri.parse('https://esewa.com.np/#/home');

  Future<void> launchEsewaInBrowser(Uri esewaUrl) async {
    if (!await launchUrl(
      esewaUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $esewaUrl');
    }
  }
}
