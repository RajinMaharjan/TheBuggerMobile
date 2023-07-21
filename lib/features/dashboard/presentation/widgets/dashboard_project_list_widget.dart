import '../../../../core/utils/constants/exports.dart';

Widget buildProjectList(
    {required BuildContext context,
    required String image,
    required String title,
    required String discription,
    required Function()? onTap}) {
  double width = mediaQueryWidth(context);
  double height = mediaQueryHeight(context);
  return Container(
    margin: EdgeInsets.symmetric(horizontal: height * 0.012),
    height: height * 0.11,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(height * 0.02),
    ),
    child: InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.012),
        ),
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              border: Border.all(color: Colors.white54),
              borderRadius: BorderRadius.circular(height * 0.012),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: height * 0.08,
              width: width * 0.16,
            ),
          ),
          title: customText(
              context: context,
              text: title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: height * 0.025),
          subtitle: customText(
              context: context,
              text: discription,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    ),
  );
}
