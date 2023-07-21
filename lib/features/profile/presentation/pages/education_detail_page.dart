import 'package:intl/intl.dart';
import 'package:qa_lint/features/addtional_information/presentation/widgets.dart';
import 'package:qa_lint/features/profile/presentation/provider/education_provider.dart';
import 'package:qa_lint/features/profile/presentation/widgets/education_widgets/saved_education_detail_widget.dart';
import 'package:qa_lint/features/profile/presentation/widgets/profile_widgets/saved_education_detail_widget.dart';

class EducationDetailPage extends StatefulWidget {
  const EducationDetailPage({super.key});

  @override
  State<EducationDetailPage> createState() => _EducationDetailPageState();
}

class _EducationDetailPageState extends State<EducationDetailPage> {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  void _handleConnectivityChanged() {
    setState(() {
      // Handle the changes in connectivity state here
      isConnected = _connectivityUtils.isConnected;
    });
  }

  @override
  void dispose() {
    _connectivityUtils.disposeConnectivity();
    super.dispose();
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      final formattedDate = _dateFormat.format(selectedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(height * 0.016),
          child: Consumer<EducationDetailProvider>(
            builder: (context, educationDetailProvider, _) {
              // ignore: curly_braces_in_flow_control_structures
              if (!educationDetailProvider.showTextField) if (educationDetailProvider
                  .educationDetails.isEmpty) {
                return Column(
                  children: [
                    Center(
                      child: customText(
                          context: context, text: 'No saved education details'),
                    ),
                    SizedBox(
                      height: height * 0.7,
                    ),
                    Center(
                      child: CustomButton(
                        text: 'Add More',
                        onPressed: educationDetailProvider.addMore,
                      ),
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (educationDetailProvider.showTextField)
                    EducationSavedDetailWidget(width: width, height: height),
                  if (!educationDetailProvider.showTextField &&
                      educationDetailProvider.educationDetails.isNotEmpty)
                    SavedEducationDetailCardWidget(
                        educationDetailProvider: educationDetailProvider),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
