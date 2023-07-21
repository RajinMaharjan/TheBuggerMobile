import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/home_page/presentation/pages/homepage.dart';
import 'package:qa_lint/features/splash/presentation/widgets/splash_custom_widget.dart';
import '../../../login/data/datasources/login_data_source.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _timer(context);
  }

  final LoginService loginService = LoginService();

  bool hasPassedQuiz = true;
  late double height;
  late double width;

  void _timer(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      // To implement hasPassedQuiz Logic from API to
      if (loginService.isLoggedIn() == true && hasPassedQuiz == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else if (loginService.isLoggedIn() == true && hasPassedQuiz == false) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    });
  }

  SplashWidget splashWidget = SplashWidget();
  @override
  Widget build(BuildContext context) {
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    return Scaffold(
      backgroundColor: customPrimarySwatch,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final deviceOrientation = MediaQuery.of(context).orientation;
            bool isLandscape = deviceOrientation == Orientation.landscape;

            final double headerFontSize =
                isTablet(context) ? height * 0.05 : height * 0.04;

            final double contentFontSize = isTablet(context)
                ? isLandscape
                    ? height * 0.035
                    : height * 0.028
                : height * 0.025;

            final double logoHeight = isTablet(context)
                ? isLandscape
                    ? height * 0.4
                    : height * 0.5
                : height * 0.37;

            final double logoWidth = isTablet(context)
                ? isLandscape
                    ? width * 0.4
                    : width * 0.5
                : width;

            return Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                splashWidget.buildContentText(
                    context, 'Welcome To', headerFontSize),
                SizedBox(
                  height: isTablet(context) ? height * 0.05 : height * 0.08,
                ),
                splashWidget.buildLogoImage(context, logoHeight, logoWidth),
                SizedBox(
                  height: height * 0.025,
                ),
                Column(
                  children: [
                    splashWidget.buildContentText(
                      context,
                      'YOUR PERSONALIZED PATHWAY',
                      contentFontSize,
                    ),
                    splashWidget.buildContentText(
                      context,
                      'TO THRIVING IN QUALITY',
                      contentFontSize,
                    ),
                    splashWidget.buildContentText(
                      context,
                      'ASSURANCE',
                      contentFontSize,
                    ),
                  ],
                ),
                SizedBox(
                  height: isTablet(context)
                      ? isLandscape
                          ? height * 0.15
                          : height * 0.05
                      : height * 0.14,
                ),
                SpinKitSpinningLines(
                  color: Colors.black,
                  size: isLandscape ? height * 0.1 : height * 0.08,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
