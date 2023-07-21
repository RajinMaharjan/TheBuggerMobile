import 'package:qa_lint/core/utils/constants/exports.dart';

class LoginWithGoogle extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? splashColor;
  final String? image;
  final Color? color;

  const LoginWithGoogle({
    super.key,
    required this.text,
    required this.onPressed,
    required this.image,
    this.splashColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    Color defultColor = color ?? AppColor.buttonColor;

    final isTabletDevice = isTablet(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrintation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrintation == Orientation.landscape;
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: height * 0.007,
          ),
          height: isLandscape
              ? isTabletDevice
                  ? height * 0.1
                  : height * 0.04
              : isTabletDevice
                  ? height * 0.08
                  : height * 0.086,
          width: isLandscape
              ? isTabletDevice
                  ?width- 80
                  :width - 45
              : isTabletDevice
                  ? width- 45
                  : width - 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(24),
            splashColor: splashColor,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: defultColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Image.asset(
                      image!,
                      height: height * 0.6,
                    ),
                  ),
                  customText(
                    context: context,
                    text: text,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
