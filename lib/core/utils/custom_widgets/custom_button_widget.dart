import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color splashColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.splashColor = Colors.white10,
  });
  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrientation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrientation == Orientation.landscape;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(24),
            splashColor: splashColor,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColor.buttonColor,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                height: isTablet(context)
                    ? isLandscape
                        ? height * 0.073
                        : height * 0.06
                    : height * 0.058,
                width: isTablet(context)
                    ? isLandscape
                        ? width - 90
                        : width - 90
                    : width - 80,
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: customText(
                    context: context,
                    text: text,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1),
              ),
            ),
          ),
        );
      },
    );
  }
}
