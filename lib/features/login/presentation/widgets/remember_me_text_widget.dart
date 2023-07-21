import 'package:qa_lint/core/utils/constants/exports.dart';

class RemembermeTextWidget extends StatelessWidget {
  const RemembermeTextWidget({
    super.key,
    required this.checkBoxProvider,
  });

  final CheckBoxVisibilityProvider checkBoxProvider;
  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height * 0.015,
      ),
      child: Row(
        children: [
          Transform.scale(
            scale: isTablet(context) ? 1.6 : 1,
            child: Checkbox(
              value: checkBoxProvider.value,
              onChanged: (value) {
                checkBoxProvider.toggleCheckBox();
              },
            ),
          ),
          customText(
              context: context,
              text: 'Remember me',
              color: AppColor.titleTextColor),
        ],
      ),
    );
  }
}
