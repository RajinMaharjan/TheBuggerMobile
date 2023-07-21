import 'package:qa_lint/core/utils/constants/exports.dart';

class BottomTextSignup extends StatelessWidget {
  const BottomTextSignup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customText(
            context: context,
            text: 'Don\'t have an account?',
            color: AppColor.titleTextColor),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: customText(
            context: context,
            text: 'Sign up',
          ),
        ),
      ],
    );
  }
}
