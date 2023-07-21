import 'package:flutter/material.dart';

// TextEdtion Controller Make Dynamic
abstract class BaseTextEditingController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

//some change
class LoginTextEditingController extends BaseTextEditingController {}

class SignupTextEditingController extends BaseTextEditingController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
}
