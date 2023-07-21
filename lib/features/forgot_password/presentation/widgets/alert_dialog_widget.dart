import 'package:qa_lint/core/utils/constants/exports.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;
  final double dialogTitleFontSize;
  final double dialogContentFontSize;
  final double dialogWidth;
  final double dialogHeight;
  final bool isTablet;
  final bool isLandscape;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
    required this.dialogTitleFontSize,
    required this.dialogContentFontSize,
    required this.dialogWidth,
    required this.dialogHeight,
    required this.isTablet,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: dialogTitleFontSize),
        ),
      ),
      content: Text(
        content,
        style: TextStyle(fontSize: dialogContentFontSize),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isTablet ? 30 : 20),
            ),
            fixedSize: Size(dialogWidth, dialogHeight),
          ),
          onPressed: onPressed,
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: isTablet
                  ? isLandscape
                      ? height * 0.02
                      : height * 0.025
                  : height * 0.02,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isTablet ? 20 : 30),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: isTablet
            ? isLandscape
                ? height * 0.2
                : height * 0.09
            : height * 0.05,
        vertical: isTablet
            ? isLandscape
                ? height * 0.06
                : height * 0.04
            : height * 0.035,
      ),
    );
  }
}
