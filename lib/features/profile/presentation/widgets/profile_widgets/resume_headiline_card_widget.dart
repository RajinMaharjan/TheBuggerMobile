import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/data/model/text_editing_controller_model.dart';

class ResumeHeadlineCardWidget extends StatefulWidget {
  final ValueChanged<String> onSubmit;
  final String? initialText;

  const ResumeHeadlineCardWidget({
    super.key,
    required this.onSubmit,
    this.initialText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ResumeHeadlineCardWidgetState createState() =>
      _ResumeHeadlineCardWidgetState();
}

class _ResumeHeadlineCardWidgetState extends State<ResumeHeadlineCardWidget> {
  final ProfileTextEditingController _controller =
      ProfileTextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialText != null) {
      _controller.resumeheadLineController.text = widget.initialText!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
            context: context, text: 'Resume Headline', color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              maxLines: null,
              controller: _controller.resumeheadLineController,
              decoration: InputDecoration(
                labelStyle: labelStyles(),
                labelText: 'Enter your resume headline',
              ),
            ),
            const SizedBox(height: 16.0),
            CustomButton(
              onPressed: () {
                String resumeHeadline =
                    _controller.resumeheadLineController.text.trim();
                widget.onSubmit(resumeHeadline);
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
    _controller.resumeheadLineController.dispose();
    super.dispose();
  }
}
