import '../../widgets.dart';

class QuizLandingPage extends StatefulWidget {
  const QuizLandingPage({Key? key}) : super(key: key);

  @override
  State<QuizLandingPage> createState() => _QuizLandingPageState();
}

class _QuizLandingPageState extends State<QuizLandingPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(child: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final deviceOrientation = MediaQuery.of(context).orientation;
            bool isLandscape = deviceOrientation == Orientation.landscape;
            return Column(
              children: [
                SizedBox(
                  height: isTablet(context) ? height * 0.05 : height * 0.1,
                ),
                Padding(
                  padding: isTablet(context)
                      ? const EdgeInsets.fromLTRB(50.0, 0.0, 30.0, 0.0)
                      : const EdgeInsets.fromLTRB(40.0, 0.0, 30.0, 0.0),
                  child: customText(
                    context: context,
                    text:
                        'You need to pass quiz to become a certified tester for this application.',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    fontSize: isTablet(context)
                        ? isLandscape
                            ? height * 0.05
                            : height * 0.05
                        : height * 0.03,
                  ),
                ),
                SizedBox(
                  height: isTablet(context)
                      ? isLandscape
                          ? height * 0.15
                          : height * 0.05
                      : height * 0.08,
                ),
                SizedBox(
                  height: isTablet(context)
                      ? isLandscape
                          ? height * 0.4
                          : height * 0.5
                      : height * 0.37,
                  width: isTablet(context)
                      ? isLandscape
                          ? width * 0.4
                          : width * 0.5
                      : width,
                  child: Center(
                    child: Image.asset(
                      ImagePath.logoQaLint,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: isTablet(context)
                      ? isLandscape
                          ? height * 0.15
                          : height * 0.10
                      : height * 0.20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: width * 0.01, horizontal: height * 0.05),
                  child: CustomButton(
                      text: 'Start Quiz',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizPage(),
                          ),
                        );
                      }),
                )
              ],
            );
          },
        ),
      )),
    );
  }
}
