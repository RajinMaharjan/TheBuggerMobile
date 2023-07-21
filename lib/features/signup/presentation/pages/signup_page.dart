import 'package:qa_lint/core/utils/constants/exports.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      final newConnectionStatus = _mapConnectivityResult(result);
      Provider.of<InternetConnectionProvider>(context, listen: false)
          .updateConnectionStatus(newConnectionStatus);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final newConnectionStatus = _mapConnectivityResult(connectivityResult);
    // ignore: use_build_context_synchronously
    Provider.of<InternetConnectionProvider>(context, listen: false)
        .updateConnectionStatus(newConnectionStatus);
  }

  InternetConnectionStatus _mapConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return InternetConnectionStatus.connected;
      case ConnectivityResult.none:
      default:
        return InternetConnectionStatus.disconnected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [commonSizedBox(context), const SignUpPageWidget()],
        ),
      ),
    );
  }
}
