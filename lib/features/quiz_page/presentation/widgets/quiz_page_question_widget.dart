import 'package:qa_lint/features/quiz_page/data/models/quiz_data_source.dart';

import '../../widgets.dart';
import 'package:qa_lint/core/utils/constants/exports.dart';

class QuizPageQuestionWidget extends StatefulWidget {
  const QuizPageQuestionWidget({super.key});

  @override
  State<QuizPageQuestionWidget> createState() => _QuizPageQuestionWidgetState();
}

class _QuizPageQuestionWidgetState extends State<QuizPageQuestionWidget> {
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

    return SizedBox(
      // height: quizQuestionLength,
      child: Consumer<QuizApiServices>(
          builder: (context, quizQuestionProvider, _) {
        if (quizQuestionProvider.isLoading) {
          const CircularProgressIndicator();
        } else if (quizQuestionProvider.hasError) {
          return const Text('Error');
        } else {
          if (quizQuestionProvider.quizzes.isEmpty) {
            return const Text('No quiz questions available');
          }
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet(context)
                ? paddingTablet30(context)
                : paddingMobile10(context),
            vertical: isTablet(context)
                ? paddingTablet30(context)
                : paddingMobile10(context),
          ),
          child: Container(
            alignment: Alignment.center,
            child: customText(
                context: context,
                text:
                    "${currentQuestionIndex + 1}.${quizQuestionProvider.quizzes[currentQuestionIndex].name}",
                color: Colors.black),
          ),
        );
      }),
    );
  }
}
