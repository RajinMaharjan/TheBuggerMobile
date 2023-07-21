import 'package:dio/dio.dart';

class DioConstants {
  //Use this url if u run directly using vs code
  // static const String baseUrl = 'http://10.0.2.2:7281';

  //Use this url if u run using command
  static const String baseUrl = 'http://10.0.2.2:5175';

  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout:
        const Duration(seconds: 5000), // Adjust the timeout duration as needed
    receiveTimeout:
        const Duration(seconds: 5000), // Adjust the timeout duration as needed
  ));
}
