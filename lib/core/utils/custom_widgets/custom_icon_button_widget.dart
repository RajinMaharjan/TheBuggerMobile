import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color splashColor;
  final Color iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.splashColor = Colors.white10,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrientation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrientation == Orientation.landscape;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: isLandscape ? height * 0.073 : height * 0.058,
          width: isLandscape ? width - 90 : width * 0.15,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: IconButton(
            icon: Center(
              child: Transform.scale(
                scale: 1.3,
                child: Icon(
                  icon,
                  size: isTablet(context)
                      ? isLandscape
                          ? height * 0.1
                          : height * 0.1
                      : height * 0.04,
                  color: iconColor,
                ),
              ),
            ),
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}
