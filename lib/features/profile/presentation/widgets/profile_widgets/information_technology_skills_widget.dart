import 'package:qa_lint/features/profile/presentation/widget.dart';

class InformationTechnologyWidget extends StatefulWidget {
  final List<String> initialSkills;
  final ValueChanged<List<String>> onSubmit;

  const InformationTechnologyWidget({
    super.key,
    required this.initialSkills,
    required this.onSubmit,
  });

  @override
  State<InformationTechnologyWidget> createState() =>
      _InformationTechnologyWidgetState();
}

class _InformationTechnologyWidgetState
    extends State<InformationTechnologyWidget> {
  late InformationTechnologyProvider _itProvider;
  late ProfileTextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProfileTextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _itProvider = Provider.of<InformationTechnologyProvider>(context);
    _itProvider.skills.addAll(widget.initialSkills);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
          context: context,
          text: 'Technology Skills',
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
                      controller: _controller.itSkillsController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.javascript,
                          color: Colors.black,
                        ),
                        hintText: 'Information Technology Skills',
                      ),
                      onChanged: (text) {
                        _itProvider.searchSkills(
                          text,
                          ItSkillsModel().itSkillsOptions,
                        );
                      },
                      onSubmitted: (text) {
                        if (_controller.itSkillsController.text.isNotEmpty) {
                          _itProvider.addSkill(text);
                          _controller.itSkillsController.clear();
                          _itProvider.matchingSkills.clear();
                        } else {
                          _controller.itSkillsController.clear();
                        }
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_controller.itSkillsController.text.isNotEmpty) {
                          _itProvider
                              .addSkill(_controller.itSkillsController.text);
                          _controller.itSkillsController.clear();
                          _itProvider.matchingSkills.clear();
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
            Consumer<InformationTechnologyProvider>(
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
            Consumer<InformationTechnologyProvider>(
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
                          _controller.itSkillsController.clear();
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
                widget.onSubmit(_itProvider.skills);
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
    _controller.itSkillsController.dispose();
    super.dispose();
  }
}
