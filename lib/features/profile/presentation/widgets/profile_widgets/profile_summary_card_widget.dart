import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/data/model/text_editing_controller_model.dart';

class ProfileSummaryCardWidget extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  final String? initialText;

  const ProfileSummaryCardWidget({
    super.key,
    required this.onSubmit,
    this.initialText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResumeHeadlineCardWidgetState createState() =>
      _ResumeHeadlineCardWidgetState();
}

class _ResumeHeadlineCardWidgetState extends State<ProfileSummaryCardWidget> {
  final ProfileTextEditingController _controller =
      ProfileTextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialText != null) {
      _controller.profileSummaryController.text = widget.initialText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
            context: context, text: 'Profile summary', color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: null,
              controller: _controller.profileSummaryController,
              decoration: InputDecoration(
                labelStyle: labelStyles(),
                labelText: 'Enter your profile summary',
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onPressed: () {
                String profileSummary =
                    _controller.profileSummaryController.text.trim();
                widget.onSubmit(profileSummary);
                Navigator.pop(context);
              },
              text: 'Add',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.profileSummaryController.dispose();
    super.dispose();
  }
}
