import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../features/login/data/datasources/login_data_source.dart';

class CustomInterceptor extends InterceptorsWrapper {
  SharedPreferences? _prefs;
  final LoginService _loginService;

  CustomInterceptor(this._loginService) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await _initPreferences();
    final token = await _loginService.getToken(); // Await the async method call
    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    _loginService.saveToken(response); // Pass the response object
    return handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    return handler.next(err);
  }

  Future<void> _initPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}
