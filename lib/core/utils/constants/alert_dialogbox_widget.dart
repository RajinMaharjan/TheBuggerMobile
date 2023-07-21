import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;
  final double dialogTitleFontSize;
  final double dialogContentFontSize;

  const AlertDialogWidget({super.key, 
    required this.title,
    required this.content,
    required this.onPressed,
    required this.dialogTitleFontSize,
    required this.dialogContentFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isTablet = mediaQuery.size.shortestSide >= 600;
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    final dialogWidth = isTablet
        ? isLandscape
            ? mediaQuery.size.height * 0.22
            : mediaQuery.size.height * 0.18
        : mediaQuery.size.height * 0.12;
    final dialogHeight = isTablet
        ? isLandscape
            ? mediaQuery.size.height * 0.06
            : mediaQuery.size.height * 0.051
        : mediaQuery.size.height * 0.04;

    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          fontSize: dialogTitleFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: customText(
        context: context,
        text: content,
        fontSize: dialogContentFontSize,
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: customText(context: context, text: 'OK'),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.fromLTRB(
        isTablet ? mediaQuery.padding.left : 16,
        16,
        isTablet ? mediaQuery.padding.right : 16,
        0,
      ),
      titlePadding: EdgeInsets.fromLTRB(
        isTablet ? mediaQuery.padding.left : 16,
        isTablet ? mediaQuery.padding.top : 16,
        isTablet ? mediaQuery.padding.right : 16,
        0,
      ),
      buttonPadding: EdgeInsets.fromLTRB(
        isTablet ? mediaQuery.padding.left : 16,
        0,
        isTablet ? mediaQuery.padding.right : 16,
        isTablet ? mediaQuery.padding.bottom : 16,
      ),
      actionsPadding: EdgeInsets.zero,
      contentTextStyle: TextStyle(fontSize: dialogContentFontSize),
      elevation: isTablet ? 24 : 16,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isTablet ? dialogWidth : 32,
        vertical: isTablet ? dialogHeight : 24,
      ),
      backgroundColor: Colors.white,
    );
  }
}
