import 'package:qa_lint/core/utils/constants/dio_constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/interceptors/custom_dio_interceptor.dart';

class LoginResult {
  String status;
  String message;

  LoginResult({
    required this.status,
    required this.message,
  });
}

class LoginService {
  final Dio _dio = DioConstants.dio;
  SharedPreferences? _prefs;
  CustomInterceptor? _customInterceptor;

  LoginService() {
    _initPreferences();
    _customInterceptor = CustomInterceptor(this);
    _dio.interceptors.add(_customInterceptor!);
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getToken() async {
    return _prefs?.getString('accessToken');
  }

  void saveToken(Response<dynamic> response) {
    final Map<String, dynamic>? responseData =
        response.data is Map<String, dynamic>
            ? response.data as Map<String, dynamic>
            : {};

    if (responseData != null && responseData.containsKey('token')) {
      final String token = responseData['token'] as String;
      _prefs?.setString('accessToken', token);
    }
  }

  Future<LoginResult> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        final message = response.data['message'];
        final status = response.data['status'];

        return LoginResult(status: status, message: message);
      } else {
        return LoginResult(status: "Failed", message: "Email Failed to send");
      }
    } on DioException catch (error) {
      String errorMessage = 'An error occurred';
      if (error.response != null && error.response!.data != null) {
        final responseData = error.response!.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('message')) {
          errorMessage = responseData['message'].toString();
        }
      }
      return LoginResult(
          status: error.response!.statusMessage.toString(),
          message: errorMessage);
    }
  }

  bool isLoggedIn() {
    final token = _prefs?.getString('accessToken');
    print("token: $token");
    return token != null;
  }

  Future<void> logout() async {
    await _initPreferences();
    _prefs?.remove('accessToken');
  }
}
