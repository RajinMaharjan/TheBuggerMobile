bool validateEmail(String email) {
  const pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{3,})$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(email);
}

bool validatePassword(String password) {
  const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(password);
}

bool validatePhoneNumber(String phoneNumber) {
  const pattern = r'^[0-9]{10}$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(phoneNumber);
}
