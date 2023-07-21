import '../../widgets.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _PasswordAndSecurityPageState();
}

class _PasswordAndSecurityPageState extends State<ChangePasswordPage> {
  @override
  void initState() {
    super.initState();
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  bool isConnected = true;
  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();

  void _handleConnectivityChanged() {
    setState(() {
      isConnected = _connectivityUtils.isConnected;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Validator validator = Validator();
  final TextEditingController currentPasswordEditingController =
      TextEditingController();
  final TextEditingController newPasswordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();
  bool isPasswordMatch() {
    final password = newPasswordEditingController.text;
    final confirmPassword = confirmPasswordEditingController.text;
    return password == confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);
    double width = mediaQueryWidth(context);
    double height = mediaQueryHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: customText(
            context: context,
            text: 'Password and Security',
            color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                customTextFormField(
                  obscureText: !passwordVisibilityProvider.isPasswordVisible,
                  prefixIcon: Icons.key,
                  context: context,
                  labelText: 'Current Password',
                  validator: validator.passwordValidator,
                  textInputAction: TextInputAction.done,
                  controller: currentPasswordEditingController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      passwordVisibilityProvider.togglePasswordVisibility();
                    },
                    icon: Icon(
                      passwordVisibilityProvider.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                customTextFormField(
                  obscureText: !passwordVisibilityProvider.isNewPasswordVisible,
                  prefixIcon: Icons.key,
                  context: context,
                  labelText: 'New Password',
                  validator: validator.passwordValidator,
                  textInputAction: TextInputAction.done,
                  controller: newPasswordEditingController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      passwordVisibilityProvider.toggleNewPasswordVisibility();
                    },
                    icon: Icon(
                      passwordVisibilityProvider.isNewPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                customTextFormField(
                  obscureText:
                      !passwordVisibilityProvider.isConfirmPasswordVisible,
                  prefixIcon: Icons.key,
                  context: context,
                  labelText: 'Confirm Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    if (!isPasswordMatch()) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  controller: confirmPasswordEditingController,
                  suffixIcon: IconButton(
                    onPressed: () {
                      passwordVisibilityProvider
                          .toggleConfirmPasswordVisibility();
                    },
                    icon: Icon(
                      passwordVisibilityProvider.isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.07,
                      ),
                      SizedBox(
                        height: height * 0.02,
                        width: width * 0.04,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(height * 0.02),
                                  color: AppColor.buttonColor),
                              child: Icon(
                                Icons.question_mark_outlined,
                                color: Colors.white,
                                size: height * 0.02,
                              )),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      customText(
                          context: context,
                          text: 'Info: Password must have',
                          fontSize: height * 0.02)
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.12,
                  width: width * 0.7,
                  child: customText(
                      context: context,
                      text:
                          '-> 8 characters or more\n-> At least one number\n-> At least one special character\n-> At least one uppercase letter\n-> At least one lowercase letter.',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.titleTextColor,
                      fontSize: height * 0.02),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                    text: 'Update password',
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          newPasswordEditingController.text ==
                              confirmPasswordEditingController.text) {
                        ConnectivityUtils()
                            .handleButtonPressed(context, '/loginPage');
                      } else {
                        Fluttertoast.showToast(
                            msg:
                                'New password and confirm password did not match.');
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _connectivityUtils.disposeConnectivity();
    currentPasswordEditingController.dispose();
    newPasswordEditingController.dispose();
    confirmPasswordEditingController.dispose();
    super.dispose();
  }
}
