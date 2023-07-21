import 'package:flutter/material.dart';

// TextEdtion Controller Make Dynamic
abstract class BaseTextEditingController {
  TextEditingController emailController =
      TextEditingController(text: 'vurilo@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'vurilo@P1');

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
