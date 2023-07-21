import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/dio_constant.dart';
import '../models/quiz_data_model.dart';

class QuizApiServices with ChangeNotifier {
  final Dio _dio = DioConstants.dio;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasError = false;
  bool get hasError => _hasError;

  List<Quiz> _quizzes = [];
  List<Quiz> get quizzes => _quizzes;

  Future<void> fetchQuizData() async {
    try {
      _isLoading = true;
      _hasError = false;
      notifyListeners();
      Response response = await _dio.get('/api/quiz');

      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        _quizzes = jsonData.map((item) => Quiz.fromJson(item)).toList();
      } else {
        _hasError = true;
        print("Failed to load data. Status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      _hasError = true;
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
