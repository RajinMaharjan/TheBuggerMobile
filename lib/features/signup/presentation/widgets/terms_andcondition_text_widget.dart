import 'package:qa_lint/core/utils/constants/exports.dart';

class TermsAndConditionTextWidget extends StatelessWidget {
  const TermsAndConditionTextWidget({super.key});
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    final checkBoxVisibilityProvider =
        Provider.of<CheckBoxVisibilityProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.scale(
              scale: _isTablet(context) ? 1.6 : 1,
              child: Checkbox(
                value: checkBoxVisibilityProvider.value,
                onChanged: (value) {
                  checkBoxVisibilityProvider.toggleCheckBox();
                },
              ),
            ),
            customText(
                context: context,
                text: 'I have read and agree to the ',
                color: AppColor.titleTextColor),
            InkWell(
              splashColor: Colors.amber,
              onTap: () {},
              child: customText(
                context: context,
                text: 'Privacy Policy',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
                context: context, text: 'and ', color: AppColor.titleTextColor),
            InkWell(
              splashColor: Colors.amber,
              onTap: () {},
              child: customText(
                context: context,
                text: 'Terms and Conditions',
              ),
            ),
          ],
        ),
        commonSizedBox(context),
        if (checkBoxVisibilityProvider.showError)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: height * 0.015,
            ),
            child: customText(
              context: context,
              text: 'You must accept Privacy Policy, and Term of Use',
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
