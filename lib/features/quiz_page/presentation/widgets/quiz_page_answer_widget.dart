import '../../data/models/quiz_data_source.dart';
import '../../widgets.dart';

class QuizPageAnswerWidget extends StatefulWidget {
  const QuizPageAnswerWidget({Key? key}) : super(key: key);

  @override
  State<QuizPageAnswerWidget> createState() => _QuizPageAnswerWidgetState();
}

class _QuizPageAnswerWidgetState extends State<QuizPageAnswerWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(microseconds: 5000),
      () {
        Provider.of<QuizApiServices>(context, listen: false).fetchQuizData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    return SizedBox(
      height: height * 0.5,
      width: width * 0.8,
      child: Consumer<QuizApiServices>(
        builder: (context, quizAnswerProvider, child) {
          return Column(
            children: quizAnswerProvider.quizzes[currentQuestionIndex].options
                .map(
                  (e) => _answerButton(e),
                )
                .toList(),
          );
        },
      ),
    );
  }

  Widget _answerButton(Question question) {
    // Update parameter type to Question
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    final quizProvider = Provider.of<QuizProvider>(context);

    bool isSelected = quizProvider.selectedAnswer == question;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: isTablet(context) ? height * 0.1 : height * 0.08,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xff1688a7) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              width: isSelected ? width * 0.005 : width * 0.001,
            ),
          ),
        ),
        onPressed: () {
          quizProvider.setSelectedAnswer(question);
        },
        child: customText(
          context: context,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: " ${question.name}", // Use questionText instead of answerText
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
