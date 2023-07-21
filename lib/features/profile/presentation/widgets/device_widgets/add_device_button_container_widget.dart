import '../../../../addtional_information/presentation/widgets.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onPressed;

  const ButtonContainer({
    super.key,
    required this.icon,
    required this.label,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: height * 0.03),
      height: height * 0.05,
      width: width * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(height * 0.01),
        border: Border.all(color: Colors.white),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.zero,
        ),
        child: Row(
          children: [
            SizedBox(width: width * 0.02),
            Icon(icon, color: Colors.white),
            SizedBox(width: width * 0.02),
            customText(context: context, text: label, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
