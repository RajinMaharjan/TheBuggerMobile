import 'package:qa_lint/core/utils/interceptors/custom_dio_interceptor.dart';
import 'package:qa_lint/core/utils/constants/dio_constant.dart';
import 'package:dio/dio.dart';
import '../../../login/data/datasources/login_data_source.dart';
import '../models/user_model.dart';

class RegistrationResult {
  String status;
  String message;

  RegistrationResult({required this.status, required this.message});
}

class SignUpService {
  final Dio _dio = DioConstants.dio;

  SignUpService() {
    _dio.interceptors.add(CustomInterceptor(LoginService()));
  }

  Future<RegistrationResult> registerUser(UserModel user) async {
    try {
      final response = await _dio.post(
        '/api/user/register',
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        final message = response.data['message'];
        final status = response.data['status'];

        return RegistrationResult(status: status, message: message);
      } else {
        return RegistrationResult(
          status: "Registration Failed",
          message: "User registration failed",
        );
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
      return RegistrationResult(
        status: error.response!.statusMessage.toString(),
        message: errorMessage,
      );
    }
  }
}
