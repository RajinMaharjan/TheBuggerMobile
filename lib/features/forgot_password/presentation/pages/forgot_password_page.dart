// ignore_for_file: use_build_context_synchronously

import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/core/utils/constants/progress_indicator_timer_constant.dart';
import 'package:qa_lint/features/forgot_password/data/forgot_password_reponse.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final ForgotPasswordService _forgotPasswordService = ForgotPasswordService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    final dialogProvider = Provider.of<DialogProvider>(context, listen: false);
    final deviceOrientation = dialogProvider.deviceOrientation(context);
    bool isLandscape = deviceOrientation == Orientation.landscape;

    final progressIndicatorTimerprovider =
        Provider.of<ProgressIndicatorTimerProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: isTablet(context)
                ? isLandscape
                    ? height * 0.05
                    : height * 0.035
                : height * 0.04,
            color: AppColor.titleTextColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'loginPage');
          },
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        title: customText(
          context: context,
          text: 'Forgot Password',
          fontSize: isLandscape ? height * 0.05 : height * 0.03,
          color: AppColor.titleTextColor,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: height * 0.3,
                child: Image.asset(
                  ImagePath.logoQaLint,
                  fit: BoxFit.cover,
                ),
              ),
              customTextFormField(
                context: context,
                labelText: 'Email',
                validator: Validator().emailValidator,
                controller: emailController,
                prefixIcon: Icons.email,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              progressIndicatorTimerprovider.isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: width * 0.6,
                      child: CustomButton(
                        text: 'Email Reset Link',
                        onPressed: () async {
                          final connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult != ConnectivityResult.none) {
                            if (formKey.currentState!.validate()) {
                              final email = emailController.text.trim();
                              progressIndicatorTimerprovider.setIsLoadingTrue();
                              progressIndicatorTimerprovider
                                  .stopProgressIndicatorTimer();
                              final ForgotPasswordResult result =
                                  await _forgotPasswordService
                                      .sendPasswordResetEmail(email);

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(result.status),
                                  content: Text(result.message),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (result.status == 'Success') {
                                          Navigator.pushNamed(
                                              context, '/loginPage');
                                          progressIndicatorTimerprovider
                                              .setIsLoadingFalse();
                                        } else {
                                          Navigator.pop(context);
                                          progressIndicatorTimerprovider
                                              .setIsLoadingFalse();
                                        }
                                      },
                                      child: const Text('OK'),
                                    )
                                  ],
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    context: context,
                    text: 'Do you have an account?',
                    color: AppColor.titleTextColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginPage');
                    },
                    child: customText(context: context, text: 'Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
