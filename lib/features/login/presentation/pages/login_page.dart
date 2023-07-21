import '../../widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late CheckBoxVisibilityProvider checkBoxProvider;
  late DialogProvider dialogProvider;

  @override
  void initState() {
    super.initState();
    checkBoxProvider = CheckBoxVisibilityProvider();
    dialogProvider = DialogProvider();

    _checkConnectivity();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      final newConnectionStatus = _mapConnectivityResult(result);
      WidgetsFlutterBinding.ensureInitialized();
      Provider.of<InternetConnectionProvider>(context, listen: false)
          .updateConnectionStatus(newConnectionStatus);
    });
  }

  bool value = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginTextEditingController loginTextEditingController =
      LoginTextEditingController();
  bool isLoading = true;

  late StreamSubscription<ConnectivityResult> subscription;
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
    double height = mediaQueryHeight(context);

    final deviceOrientation = dialogProvider.deviceOrientation(context);
    final dialogWidth = dialogProvider.getDialogWidth(context);
    final dialogHeight = dialogProvider.getDialogHeight(context);
    final dialogTitleFontSize = dialogProvider.getDialogTitleFontSize(context);
    final dialogContentFontSize =
        dialogProvider.getDialogContentFontSize(context);
    bool isLandscape = deviceOrientation == Orientation.landscape;

    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Consumer<InternetConnectionProvider>(
          builder: (context, connectionProvider, _) {
            return SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height:
                              isTablet(context) ? height * 0.05 : height * 0.1,
                        ),
                        Center(
                          child: Image.asset(
                            ImagePath.tb_logo,
                            fit: BoxFit.contain,
                            height:
                                isTablet(context) ? height * 0.2 : height * 0.2,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        LoginPageWidget(
                          loginEditingController: loginTextEditingController,
                        ),
                        const ForgotButtonWidget(),
                        commonSizedBox(context),
                        Center(
                          child: LoginButtonWidget(
                            formKey: formKey,
                            loginTextEditingController:
                                loginTextEditingController,
                            dialogTitleFontSize: dialogTitleFontSize,
                            dialogContentFontSize: dialogContentFontSize,
                            dialogWidth: dialogWidth,
                            dialogHeight: dialogHeight,
                            isLandscape: isLandscape,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        const OrTextAndDividerWidget(),
                        LoginWithGoogle(
                          image: ImagePath.googleLogo,
                          onPressed: () {},
                          text: 'Login with Google',
                        ),
                        const Spacer(),
                        const BottomTextSignup(),
                      ],
                    ),
                  )),
            );
          },
        );
      }),
    );
  }
}
