import '../../../../core/utils/constants/exports.dart';

Widget buildContainer(
    {Color? color,
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required int count,
    required Function()? onTap}) {
  double width = mediaQueryWidth(context);
  double height = mediaQueryHeight(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      margin:
          EdgeInsets.symmetric(horizontal:height* 0.012),
      padding:
          EdgeInsets.symmetric(horizontal:height* 0.01),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(height * 0.012),
      ),
      alignment: Alignment.center,
      height:height* 0.1,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(
                width:height* 0.02,
              ),
              customText(context: context, text: title, color: Colors.black),
            ],
          ),
          SizedBox(
            height:width* 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width:width* 0.1),
              customText(
                context: context,
                text: count.toString(),
              ),
              SizedBox(
                width:width* 0.02,
              ),
              customText(
                context: context,
                text: subtitle,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
