import 'package:flutter/material.dart';

import '../constants/constants.dart';

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

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

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
          height: isTablet(context)
              ? isLandscape
                  ? height * 0.073
                  : height * 0.058
              : height * 0.058,
          width: isLandscape
              ? width - 90
              : width * 0.15,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: height * 0.03),
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
                      : height * 0.02,
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
