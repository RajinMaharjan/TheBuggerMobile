import 'package:qa_lint/core/utils/constants/exports.dart';

import '../../../features/login/widgets.dart';

Widget buildContentWithoutInternet(BuildContext context) {
  double height = mediaQueryHeight(context);


  final dialogProvider = Provider.of<DialogProvider>(context, listen: false);
  final deviceOrientation = dialogProvider.deviceOrientation(context);
  bool isLandscape = deviceOrientation == Orientation.landscape;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
          height: isTablet(context)
              ? isLandscape
                  ? height * 0.08
                  : height * 0.08
              : height * 0.04),
      Image.asset(
        ImagePath.noInternet,
        fit: BoxFit.cover,
        height: isTablet(context)
            ? isLandscape
                ? height * 0.6
                : height * 0.7
            : height * 0.5,
      ),
      SizedBox(
        height: isTablet(context)
            ? isLandscape
                ? height * 0.08
                : height * 0.01
            : height * 0.01,
      ),
      customText(
          context: context,
          text: 'Something went wrong !',
          fontSize: height * 0.038,
          fontWeight: FontWeight.w400,
          color: AppColor.titleTextColor),
      customText(
          context: context,
          text: 'Make sure you are connected to network.',
          color: AppColor.titleTextColor),
      SizedBox(
        height: isTablet(context)
            ? isLandscape
                ? height * 0.05
                : height * 0.04
            : height * 0.15,
      ),
      LoginWithGoogle(
        image: ImagePath.retry,
        text: 'Retry',
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/loginPage');
        },
      ),
    ],
  );
}
