import 'package:qa_lint/core/utils/constants/exports.dart';

class SplashWidget {
  Widget buildHeaderText(BuildContext context, String text, double fontSize) {
    return customText(
      context: context,
      text: text,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
      fontSize: fontSize,
    );
  }

  Widget buildContentText(BuildContext context, String text, double fontSize) {
    return customText(
      context: context,
      text: text,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
    );
  }

  Widget buildLogoImage(BuildContext context, double height, double width) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Image.asset(
          ImagePath.bugger_logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
