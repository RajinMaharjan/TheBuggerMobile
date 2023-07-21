import 'package:qa_lint/core/utils/constants/exports.dart';

class ForgotButtonWidget extends StatelessWidget {
  const ForgotButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: customText(
                context: context,
                text: 'Forgot your password?',
                color: AppColor.buttonColor),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/forgotPassword');
            },
          ),
        ],
      ),
    );
  }
}
