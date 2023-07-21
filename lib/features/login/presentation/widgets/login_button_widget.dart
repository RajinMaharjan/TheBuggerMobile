import 'package:qa_lint/core/utils/constants/progress_indicator_timer_constant.dart';
import 'package:qa_lint/features/login/data/datasources/login_data_source.dart';
import '../../../home_page/presentation/pages/homepage.dart';
import '../../widgets.dart';

class LoginButtonWidget extends StatefulWidget {
  const LoginButtonWidget({
    Key? key,
    required this.formKey,
    required this.loginTextEditingController,
    required this.dialogTitleFontSize,
    required this.dialogContentFontSize,
    required this.dialogWidth,
    required this.dialogHeight,
    required this.isLandscape,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final LoginTextEditingController loginTextEditingController;
  final double dialogTitleFontSize;
  final double dialogContentFontSize;
  final double dialogWidth;
  final double dialogHeight;
  final bool isLandscape;

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  final LoginService _loginService = LoginService();
  bool hasPassedQuiz = false;
  @override
  Widget build(BuildContext context) {
    final progressIndicatorTimerprovider =
        Provider.of<ProgressIndicatorTimerProvider>(context);
    return progressIndicatorTimerprovider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CustomButton(
            text: 'Login',
            onPressed: () async {
              if (widget.formKey.currentState!.validate()) {
                final email =
                    widget.loginTextEditingController.emailController.text;
                final password =
                    widget.loginTextEditingController.passwordController.text;
                progressIndicatorTimerprovider.setIsLoadingTrue();

                final LoginResult result =
                    await _loginService.login(email, password);
                // Registration success
                String status = result.status;
                String message = result.message;

                if (status == 'Success') {
                  // ignore: use_build_context_synchronously
                  if (_loginService.isLoggedIn() == true &&
                      hasPassedQuiz == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const QuizLandingPage()),
                    );
                  }
                  progressIndicatorTimerprovider.setIsLoadingFalse();
                } else {
                  // ignore: use_build_context_synchronously
                  showAlertDialog(context, status, message, () {
                    Navigator.pop(context);
                    progressIndicatorTimerprovider.setIsLoadingFalse();
                  });
                }
              }
            },
          );
  }

  void showAlertDialog(
      BuildContext context, String title, String message, onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: onPressed,
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
