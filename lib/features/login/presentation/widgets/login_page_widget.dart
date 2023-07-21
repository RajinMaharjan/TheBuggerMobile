import 'package:qa_lint/core/utils/constants/exports.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key? key,
    required this.loginEditingController,
  }) : super(key: key);
  final LoginTextEditingController loginEditingController;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            customTextFormField(
                prefixIcon: Icons.email,
                context: context,
                labelText: 'Email',
                validator: validator.emailValidator,
                textInputAction: TextInputAction.next,
                controller: widget.loginEditingController.emailController),
            customTextFormField(
              obscureText: !passwordVisibilityProvider.isLoginPasswordVisible,
              prefixIcon: Icons.key,
              context: context,
              labelText: 'Password',
              validator: validator.passwordValidator,
              textInputAction: TextInputAction.done,
              controller: widget.loginEditingController.passwordController,
              suffixIcon: IconButton(
                onPressed: () {
                  passwordVisibilityProvider.toggleLoginPasswordVisibility();
                },
                icon: Icon(
                  passwordVisibilityProvider.isLoginPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: isTablet(context)
                      ? (orientations == Orientation.landscape
                          ? iconSizeTabletLandscape(context)
                          : iconSizeTablet(context))
                      : iconSizeMobile(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
