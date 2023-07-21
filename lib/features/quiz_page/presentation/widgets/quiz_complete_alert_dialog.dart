import '../../data/models/quiz_data_source.dart';
import '../../widgets.dart';

class AlertDialogWidget extends StatefulWidget {
  final double dialogTitleFontSize;
  final double dialogContentFontSize;
  final double dialogWidth;
  final double dialogHeight;
  final bool isTablet;
  final bool isLandscape;

  const AlertDialogWidget({
    super.key,
    required this.dialogTitleFontSize,
    required this.dialogContentFontSize,
    required this.dialogWidth,
    required this.dialogHeight,
    required this.isTablet,
    required this.isLandscape,
  });

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    bool isPassed = false;
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    final quizIndexProvider = Provider.of<QuizApiServices>(context);
    final quizLength = quizIndexProvider.quizzes.length;
    if (quizProvider.score >= quizLength * 0.8) {
      //pass if 80 %
      isPassed = true;
    }
    String title = 'Result';
    String image = isPassed ? ImagePath.quizPassed : ImagePath.quizFailed;
    String content = isPassed
        ? "Passed: Score is ${quizProvider.score}"
        : "Failed: Score is ${quizProvider.score}";

    return AlertDialog(
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: widget.dialogTitleFontSize,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: height * 0.003,
            color: Colors.black,
          )
        ],
      ),
      content: Container(
        height: height * 0.13,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.backgroundColor),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                  height: height * 0.1,
                  width: width,
                  child: Image.asset(image)),
              SizedBox(
                height: height * 0.005,
              ),
              Text(
                content,
                style: TextStyle(
                    fontSize: widget.dialogTitleFontSize,
                    color: isPassed ? Colors.green : Colors.red),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.isTablet ? 30 : 20),
            ),
            fixedSize: Size(widget.dialogWidth, widget.dialogHeight),
          ),
          onPressed: () {
            isPassed
                ? Navigator.popAndPushNamed(context, '/homePage')
                : Navigator.popAndPushNamed(context, '/homePage');
          },
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: widget.isTablet
                  ? widget.isLandscape
                      ? height * 0.02
                      : height * 0.025
                  : height * 0.02,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.isTablet ? 20 : 30),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: widget.isTablet
            ? widget.isLandscape
                ? height * 0.2
                : height * 0.09
            : height * 0.05,
        vertical: widget.isTablet
            ? widget.isLandscape
                ? height * 0.06
                : height * 0.04
            : height * 0.035,
      ),
    );
  }
}
