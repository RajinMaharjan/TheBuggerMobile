import '../../widgets.dart';

class QuizProvider extends ChangeNotifier {
  int currentQuestionIndex = 0;
  int score = 0;
  Question? selectedAnswer;
  List<Question> previouslySelectedAnswers = [];

  void setCurrentQuestionIndex(int index) {
    currentQuestionIndex = index;
    notifyListeners();
  }

  void setSelectedAnswer(Question question) {
    // Change type to Question
    selectedAnswer = question;
    previouslySelectedAnswers
        .add(question); // Append selected answer to the list
    notifyListeners();
  }

  void submitAnswer() {
    // Check if the selected answer is correct and update the score

    // Move to the next question
    currentQuestionIndex++;

    notifyListeners();
  }

  void submitLastAnswer() {
    // Check if the selected answer is correct and update the score
    // if (selectedAnswer?.isCorrect == true) {
    //   score++;
    // }
    currentQuestionIndex = currentQuestionIndex;
    // Notify listeners about the state changes
    notifyListeners();
  }

  void unsubmitAnswer() {
    // Check if the selected answer is correct and update the score
    // if (selectedAnswer?.isCorrect == true) {
    //   score--;
    // }

    // Move to the previous question
    currentQuestionIndex--;

    // Retrieve the previously selected answer from the list
    // if (currentQuestionIndex >= 0 &&
    //     currentQuestionIndex < previouslySelectedAnswers.length) {
    //   selectedAnswer = previouslySelectedAnswers[currentQuestionIndex];
    // } else {
    //   selectedAnswer = null;
    // }

    // Notify listeners about the state changes
    notifyListeners();
  }

  void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    previouslySelectedAnswers
        .clear(); // Clear the list of previously selected answers
    notifyListeners();
  }
}
