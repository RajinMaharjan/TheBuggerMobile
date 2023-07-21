import 'package:qa_lint/core/utils/constants/exports.dart';

Widget buildCard({
  String? text,
  String? notMentioned,
  IconData? icon,
  void Function()? onPressed,
  bool isAdded = false,
  required BuildContext context,
  String? additionalText,
  Widget? widget,
}) {
  double height = mediaQueryHeight(context);

  return Column(
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: height * 0.01),
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height * 0.01),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: customText(
                        context: context, text: text, color: Colors.black),
                  ),
                  isAdded
                      ? IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            icon,
                            color: Colors.blue,
                          ),
                        )
                      : InkWell(
                          onTap: onPressed,
                          child: Padding(
                            padding: EdgeInsets.all(height * 0.01),
                            child: customText(
                                context: context,
                                text: 'Add',
                                color: Colors.blue),
                          ),
                        )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                child: additionalText != null
                    ? customText(
                        context: context,
                        text: additionalText,
                        fontSize: height * 0.02,
                        color: Colors.blue,
                      )
                    : customText(
                        context: context,
                        text: notMentioned,
                        fontSize: height * 0.02,
                        color: Colors.blue,
                      ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: height * 0.01),
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  child: widget,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
