import 'package:qa_lint/features/profile/presentation/widget.dart';

class KeySkillCardPageWidget extends StatefulWidget {
  final List<String> initialSkills;
  final ValueChanged<List<String>> onSubmit;

  const KeySkillCardPageWidget({
    Key? key,
    required this.initialSkills,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<KeySkillCardPageWidget> createState() => _KeySkillCardPageWidgetState();
}

class _KeySkillCardPageWidgetState extends State<KeySkillCardPageWidget> {
  @override
  void initState() {
    super.initState();
    _controller = ProfileTextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _keySkillProvider = Provider.of<KeySkillProvider>(context);
    _keySkillProvider.skills.addAll(widget.initialSkills);
  }

  late KeySkillProvider _keySkillProvider;
  late ProfileTextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
          context: context,
          text: 'Key Skills',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller.keySkillsContoller,
                      decoration: const InputDecoration(
                        hintText: 'Type your skills',
                      ),
                      onChanged: (text) {
                        _keySkillProvider.searchSkills(
                            text, KeySkillsModel().keySkills);
                      },
                      onSubmitted: (text) {
                        if (_controller.keySkillsContoller.text.isNotEmpty) {
                          _keySkillProvider.addSkill(text);
                          _controller.keySkillsContoller.clear();
                          _keySkillProvider.matchingSkills.clear();
                        } else {
                          _controller.keySkillsContoller.clear();
                        }
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColor.buttonColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_controller.keySkillsContoller.text.isNotEmpty) {
                          _keySkillProvider
                              .addSkill(_controller.keySkillsContoller.text);
                          _controller.keySkillsContoller.clear();
                          _keySkillProvider.matchingSkills.clear();
                        } else {
                          Fluttertoast.showToast(
                            msg: "Text can't be empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Consumer<KeySkillProvider>(
              builder: (context, provider, _) {
                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: provider.skills.map((skill) {
                    return Chip(
                      backgroundColor: Colors.greenAccent,
                      label: customText(context: context, text: skill),
                      onDeleted: () {
                        provider.removeSkill(skill);
                      },
                    );
                  }).toList(),
                );
              },
            ),
            Consumer<KeySkillProvider>(
              builder: (context, provider, _) {
                if (provider.matchingSkills.isNotEmpty) {
                  return Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: provider.matchingSkills.map((skill) {
                      return InputChip(
                        label: customText(context: context, text: skill),
                        onPressed: () {
                          provider.addSkill(skill);
                          _controller.keySkillsContoller.clear();
                          provider.matchingSkills.clear();
                        },
                      );
                    }).toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            CustomButton(
              onPressed: () {
                widget.onSubmit(_keySkillProvider.skills);
                Navigator.pop(context);
              },
              text: 'Done',
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.keySkillsContoller.dispose();
    super.dispose();
  }
}
