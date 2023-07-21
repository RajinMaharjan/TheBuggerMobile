import 'package:dio/dio.dart';
import 'package:qa_lint/core/utils/constants/dio_constant.dart';
import '../../../core/utils/interceptors/custom_dio_interceptor.dart';
import '../../login/data/datasources/login_data_source.dart';

class ForgotPasswordService {
  final Dio _dio = DioConstants.dio;

  ForgotPasswordService() {
    _dio.interceptors.add(CustomInterceptor(LoginService()));
  }

  Future<ForgotPasswordResult> sendPasswordResetEmail(String email) async {
    try {
      final response = await _dio.post(
        '/api/user/forgotpassword',
        data: {
          'email': email,
        },
      );
      if (response.statusCode == 200) {
        final message = response.data['message'];
        final status = response.data['status'];
        return ForgotPasswordResult(
          message: message,
          status: status,
        );
      } else {
        return ForgotPasswordResult(
          message: '',
          status: '',
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
      return ForgotPasswordResult(
        status: error.response!.statusMessage.toString(),
        message: errorMessage,
      );
    }
  }
}

class ForgotPasswordResult {
  String message;
  String status;
  ForgotPasswordResult({
    required this.message,
    required this.status,
  });
}
