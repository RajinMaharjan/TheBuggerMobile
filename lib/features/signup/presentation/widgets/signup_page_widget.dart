import 'package:qa_lint/core/utils/constants/exports.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  bool value = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrantation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrantation == Orientation.landscape;
        // ignore: unused_local_variable
        double widthFactor =
            isTablet(context) ? width * 0.0011 : width * 0.0028;

        if (isLandscape) {
          widthFactor *= 0.7;
        }

        return Column(
          children: [
            Image.asset(
              ImagePath.logoQaLint,
              fit: BoxFit.cover,
              height: isTablet(context) ? height * 0.2 : height * 0.133,
            ),
            const SignupFormFields(),
            SizedBox(
              height: isTablet(context)
                  ? isLandscape
                      ? height * 0.035
                      : height * 0.09
                  : height * 0.04,
            ),
            const TermsAndConditionTextWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: isTablet(context) ? height * 0.03 : height * 0.001,
                ),
                SizedBox(
                  height: isTablet(context)
                      ? isLandscape
                          ? height * 0.035
                          : height * 0.09
                      : height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                        context: context,
                        text: 'Do you have an account?',
                        color: AppColor.titleTextColor),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: customText(
                        context: context,
                        text: 'Log in',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
