import 'package:qa_lint/core/utils/constants/validator.dart';

class Validator {
  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    if (!validatePhoneNumber(value)) {
      return 'Invalid Phone Number';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email';
    }
    if (!validateEmail(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? nationalIdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'National ID is required';
    }
    return null;
  }

  String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  String? degreeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Degree is required';
    }
    return null;
  }

  String? startDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Start Date is required';
    }
    return null;
  }

  String? specializationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Specialization is required';
    }
    return null;
  }

  String? deviceNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Device Name is required';
    }
    return null;
  }

  String? opretingSystemValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Opreting System is required';
    }
    return null;
  }

  String? universityDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'University Name is required';
    }
    return null;
  }

  String? courseValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Course is required';
    }
    return null;
  }

  String? endDateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'End Date is required';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter password';
    }
    if (password.length < 8) {
      return 'Password should contain at least: \n- Password length 8\n- One special character \n- One uppercase letter\n- One number';
    }

    if (!password.contains(RegExp(r'[!@#\$&*~]'))) {
      return 'Password should contain at least: \n- Password length 8\n- One special character \n- One uppercase letter\n- One number';
    }

    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password should contain at least: \n- Password length 8\n- One special character \n- One uppercase letter\n- One number';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password should contain at least: \n- Password length 8\n- One special character \n- One uppercase letter\n- One number';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password should contain at least: \n- Password length 8\n- One special character \n- One uppercase letter\n- One number';
    }

    return null;
  }

  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'First Name is required';
    }
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last Name is required';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }
    if (value != password) {
      return 'Password does not match';
    }
    return null;
  }

  String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!validatePassword(value)) {
      return 'Invalid Password';
    }
    return null;
  }
}
