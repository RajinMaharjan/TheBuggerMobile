import '../../data/models/quiz_data_source.dart';
import '../../widgets.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    final quizProvider = Provider.of<QuizProvider>(context);
    final width = mediaQueryWidth(context);
    final quizApiProvider = Provider.of<QuizApiServices>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(height * 0.008),
            child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: const QuizPageTimerWidget()),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.all(height * 0.008),
          child: SizedBox(
            child: Image.asset(
              ImagePath.bugger_logo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: (quizApiProvider.quizzes.isEmpty)
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: height * 0.08,
                      child: Consumer<QuizApiServices>(
                        builder: (context, quizIndexProvider, child) {
                          return ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: quizIndexProvider.quizzes.length,
                            itemBuilder: (BuildContext context, int index) {
                              bool isButtonPressed =
                                  currentQuestionIndex == index;
                              return Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isButtonPressed
                                          ? AppColor.buttonColor
                                          : AppColor.backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColor.buttonColor),
                                    ),
                                    height: isTablet(context)
                                        ? height * 0.05
                                        : height * 0.05,
                                    width: isTablet(context)
                                        ? height * 0.07
                                        : width * 0.12,
                                    child: TextButton(
                                      onPressed: () {
                                        quizProvider
                                            .setCurrentQuestionIndex(index);
                                        _scrollToIndex(index);
                                      },
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty
                                            .resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                            return isButtonPressed
                                                ? Colors.white
                                                : Colors.black;
                                          },
                                        ),
                                      ),
                                      child: customText(
                                          context: context,
                                          text: '${index + 1}',
                                          color: isButtonPressed
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.05),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const QuizPageQuestionWidget(),
                  const QuizPageAnswerWidget(),
                ],
              ),
            ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(height * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (currentQuestionIndex == 0)
                ? _nextButton()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(
                      //   width: width * 0.005,
                      // ),
                      _previousButton(),
                      _nextButton(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void _scrollToIndex(int index) {
    double itemOffset = index * (mediaQueryHeight(context) * 0.05 + 23);
    double scrollOffset = itemOffset - mediaQueryWidth(context) * 0.2;
    _scrollController.animateTo(scrollOffset,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  _nextButton() {
    final quizProvider = Provider.of<QuizProvider>(context);
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);

    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    bool isLastQuestion = false;
    final quizIndexProvider = Provider.of<QuizApiServices>(context);
    final quizLength = quizIndexProvider.quizzes.length;
    if (currentQuestionIndex == quizLength - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      width: width * 0.3,
      height: height * 0.04,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: AppColor.buttonColor,
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            if (isLastQuestion) {
              //To implement: Submit last answer to show score.
              quizProvider.submitLastAnswer();

              //display score
              showDialog(context: context, builder: (_) => _showScoreDialog());
            } else {
              //To implement: Submit each answer to API.
              //next question
              quizProvider.submitAnswer();
              _scrollToIndex(currentQuestionIndex);
            }
          },
          child: customText(
              context: context,
              text: isLastQuestion ? "Finish" : "Next",
              color: Colors.white)),
    );
  }

  _previousButton() {
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    return SizedBox(
      width: width * 0.3,
      height: height * 0.04,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.buttonColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          //previous question
          quizProvider.unsubmitAnswer();
          _scrollToIndex(currentQuestionIndex);
        },
        child:
            customText(context: context, text: "Previous", color: Colors.white),
      ),
    );
  }

  _showScoreDialog() {
    final height = mediaQueryHeight(context);
    final mediaQuery = MediaQuery.of(context);
    final isTablet = mediaQuery.size.shortestSide >= 600;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    return AlertDialogWidget(
      dialogWidth: isTablet
          ? isLandscape
              ? mediaQuery.size.height * 0.22
              : mediaQuery.size.height * 0.18
          : mediaQuery.size.height * 0.12,
      dialogHeight: isTablet
          ? isLandscape
              ? mediaQuery.size.height * 0.06
              : mediaQuery.size.height * 0.051
          : mediaQuery.size.height * 0.04,
      dialogTitleFontSize: height * 0.02,
      dialogContentFontSize: height * 0.016,
      isTablet: isTablet,
      isLandscape: isLandscape,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
