import '../../widgets.dart';

class QuizPageTimerWidget extends StatefulWidget {
  const QuizPageTimerWidget({super.key});

  @override
  State<QuizPageTimerWidget> createState() => _QuizPageTimerWidgetState();
}

class _QuizPageTimerWidgetState extends State<QuizPageTimerWidget> {
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  int _totalSeconds = 1800;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    double width = mediaQueryWidth(context);
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final deviceOrientation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrientation == Orientation.landscape;
        return Consumer<QuizProvider>(
            builder: (context, value, child) => Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: isTablet(context)
                            ? isLandscape
                                ? iconSizeTabletLandscape(context)
                                : iconSizeTablet(context)
                            : iconSizeMobile(context),
                      ),
                      SizedBox(
                        width: width * 0.015,
                      ),
                      customText(
                          text: _formatTime(_totalSeconds),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          context: context,
                          color:
                              _totalSeconds < 60 ? Colors.red : Colors.white),
                      // if (_totalSeconds < 1) _showScoreDialog(),
                    ],
                  ),
                ));
      },
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_totalSeconds < 1) {
          timer.cancel();
          showDialog(context: context, builder: (_) => _showScoreDialog());
        } else {
          _totalSeconds--;
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
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
    _timer.cancel();
    super.dispose();
  }
}
