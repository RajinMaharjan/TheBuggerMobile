import 'package:intl/intl.dart';
import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/data/model/education_options_model.dart';
import 'package:qa_lint/features/addtional_information/presentation/widgets/addtional_custom_text_form_filed_widget.dart';
import 'package:qa_lint/features/addtional_information/presentation/widgets/text_form_field_contoller.dart';

class EducationTextFieldWidget extends StatefulWidget {
  const EducationTextFieldWidget(
      {super.key,
      required this.educationDetailController,
      required this.validator});
  final Validator validator;
  final EducationDetailController educationDetailController;

  @override
  State<EducationTextFieldWidget> createState() =>
      _EducationTextFieldWidgetState();
}

class _EducationTextFieldWidgetState extends State<EducationTextFieldWidget> {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      final formattedDate = _dateFormat.format(selectedDate);
      setState(() {
        controller.text = formattedDate;
      });
    }
  }

  List<String> degreeOptions = [
    'Associate Degree',
    'Bachelor\'s Degree',
    'Master\'s Degree',
    'Computer Science',
    'Computer Engineering',
    'Other',
  ];
  Options degreeOption = Options();
  String? selectedDegree;
  EducationDetailController educationController = EducationDetailController();
  Validator validator = Validator();

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    return Column(
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(
              paddingMobile10(context),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(height * 0.015)),
            labelText: 'Degree',
            prefixIcon: const Icon(Icons.school),
          ),
          value: selectedDegree,
          onChanged: (newValue) {
            setState(() {
              selectedDegree = newValue;
            });
          },
          items: degreeOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: customText(context: context, text: value),
            );
          }).toList(),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.house,
          context: context,
          labelText: 'University/Institute',
          validator: validator.universityDateValidator,
          controller: educationController.universityIdController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.folder_special,
          context: context,
          labelText: 'Courses',
          controller: educationController.courseController,
          validator: validator.courseValidator,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.spa,
          context: context,
          labelText: 'Specialization',
          validator: validator.specializationValidator,
          controller: educationController.specializationController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          readOnly: true,
          onTap: () => _selectDate(educationController.startDateController),
          prefixIcon: Icons.date_range,
          context: context,
          labelText: 'Start Date',
          validator: validator.startDateValidator,
          controller: educationController.startDateController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.done,
          readOnly: true,
          onTap: () => _selectDate(educationController.endDateController),
          prefixIcon: Icons.date_range_sharp,
          context: context,
          labelText: 'End Date',
          validator: validator.endDateValidator,
          controller: educationController.endDateController,
        ),
      ],
    );
  }
}
