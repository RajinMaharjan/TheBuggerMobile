import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:intl/intl.dart';
import 'package:qa_lint/features/profile/data/model/certification_model.dart';

class CertificationCardWidget extends StatefulWidget {
  final Function(CertificationData) onSubmit; // Add onSubmit callback
  final CertificationData? initialData;
  const CertificationCardWidget({
    Key? key,
    required this.onSubmit,
    required this.initialData,
  }) : super(key: key);

  @override
  State<CertificationCardWidget> createState() =>
      _CertificationCardWidgetState();
}

class _CertificationCardWidgetState extends State<CertificationCardWidget> {
  @override
  void initState() {
    super.initState();
    if (widget.initialData != null) {
      final initialData = widget.initialData!;
      startDateController.text = initialData.startDate;
      certificationName.text = initialData.name;
      certificationCompletionID.text = initialData.completionID;
      certificationURl.text = initialData.url;
      endDateController.text = initialData.endDate;
    }
  }

  TextEditingController startDateController = TextEditingController();
  TextEditingController certificationName = TextEditingController();
  TextEditingController certificationCompletionID = TextEditingController();
  TextEditingController certificationURl = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      final formattedDate = _dateFormat.format(selectedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  List<CertificationData> certifications = [];
  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: customText(
            context: context, text: 'Certificate', color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.012),
              child: Consumer<CheckBoxVisibilityProvider>(
                builder: (context, provider, child) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      controller: certificationName,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: height * 0.02, vertical: height * 0.02),
                        labelText: 'Certification Name',
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      controller: certificationCompletionID,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: height * 0.02, vertical: height * 0.02),
                        labelText: 'Certification Completion ID',
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      controller: certificationURl,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: height * 0.02, vertical: height * 0.02),
                        labelText: 'Certification URL',
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                      child: customText(
                          context: context,
                          text: 'Certification Validity',
                          fontSize: height * 0.016),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextFormField(
                            onTap: () => _selectDate(startDateController),
                            controller: startDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: height * 0.02,
                                  vertical: height * 0.02),
                              labelText: 'MM/YYYY',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: height * 0.025,
                        ),
                        Visibility(
                          visible: !provider.value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: height * 0.02,
                                vertical: height * 0.02),
                            child: customText(
                                context: context,
                                text: 'to',
                                fontSize: height * 0.018),
                          ),
                        ),
                        SizedBox(
                          width: height * 0.025,
                        ),
                        Visibility(
                          visible: !provider.value,
                          child: Expanded(
                            child: TextFormField(
                              onTap: () => _selectDate(endDateController),
                              controller: endDateController,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: height * 0.02,
                                    vertical: height * 0.02),
                                labelText: 'MM/YYYY',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: provider.value,
                          onChanged: (value) => provider.toggleCheckBox(),
                        ),
                        customText(
                            context: context,
                            text: 'This certification does not expire',
                            fontSize: height * 0.018),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: height * 0.012),
                          child: customText(
                            context: context,
                            text:
                                'You can add up 15 certifications to your Profile',
                            fontSize: height * 0.018,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.05),
                    CustomButton(
                      text: 'Save',
                      onPressed: () {
                        final certificationNameText = certificationName.text;
                        final certificationCompletionIDText =
                            certificationCompletionID.text;
                        final certificationUrlText = certificationURl.text;
                        final startDateText = startDateController.text;
                        final endDateText = endDateController.text;

                        final certificationData = CertificationData(
                          name: certificationNameText,
                          completionID: certificationCompletionIDText,
                          url: certificationUrlText,
                          startDate: startDateText,
                          endDate: endDateText,
                        );

                        widget.onSubmit(certificationData);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
