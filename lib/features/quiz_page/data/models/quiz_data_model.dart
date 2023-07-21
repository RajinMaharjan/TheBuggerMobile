class Quiz {
  String name;
  List<Question> options;

  Quiz({
    required this.name,
    required this.options,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<dynamic> optionsList = json['options'] ?? [];
    List<Question> options =
        optionsList.map((option) => Question.fromJson(option)).toList();

    return Quiz(
      name: json['name'] ?? '',
      options: options,
    );
  }
}

class Question {
  String questionId;
  String name;

  Question({
    required this.questionId,
    required this.name,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['questionId'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
