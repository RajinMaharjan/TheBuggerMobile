import 'package:qa_lint/core/utils/constants/exports.dart';

class OrTextAndDividerWidget extends StatelessWidget {
  const OrTextAndDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: height * 0.015,
          ),
          child: customText(
            context: context,
            text: 'OR',
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
