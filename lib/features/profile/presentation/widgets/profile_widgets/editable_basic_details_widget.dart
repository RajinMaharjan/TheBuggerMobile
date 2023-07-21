import '../../widget.dart';

Widget editableBasicDetails({
  required TextEditingController controller,
  required IconData icon,
  required String labelText,
  required BuildContext context,
}) {
  double height = mediaQueryHeight(context);

  return Row(
    children: [
      Icon(
        icon,
        color: Colors.black54,
      ),
      SizedBox(
        width: height * 0.03,
      ),
      Expanded(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
          ),
        ),
      ),
    ],
  );
}
