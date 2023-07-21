import 'package:intl/intl.dart';
import 'package:qa_lint/features/addtional_information/presentation/widgets/text_form_field_contoller.dart';
import '../../../../core/utils/constants/exports.dart';
import 'addtional_custom_text_form_filed_widget.dart';

class ExperienceTextFormFiledWidget extends StatefulWidget {
  const ExperienceTextFormFiledWidget({
    super.key,
    required this.validator,
    required this.experienceController,
  });

  final Validator validator;
  final ExperienceController experienceController;

  @override
  State<ExperienceTextFormFiledWidget> createState() =>
      _ExperienceTextFormFiledWidgetState();
}

class _ExperienceTextFormFiledWidgetState
    extends State<ExperienceTextFormFiledWidget> {
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

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

  final ExperienceController _experienceController = ExperienceController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAdditionalTextFormField(
          prefixIcon: Icons.devices,
          context: context,
          labelText: 'Experience Name',
          validator: widget.validator.deviceNameValidator,
          controller: widget.experienceController.experienceNameController,
        ),
        customAdditionalTextFormField(
          prefixIcon: Icons.system_security_update,
          context: context,
          labelText: 'Experience Description',
          validator: widget.validator.opretingSystemValidator,
          controller:
              widget.experienceController.experienceDescriptionController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          readOnly: true,
          onTap: () => _selectDate(_experienceController.startDateController),
          prefixIcon: Icons.date_range,
          context: context,
          labelText: 'Start Date',
          controller: _experienceController.startDateController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.done,
          readOnly: true,
          onTap: () => _selectDate(_experienceController.endDateController),
          prefixIcon: Icons.date_range_sharp,
          context: context,
          labelText: 'End Date',
          controller: _experienceController.endDateController,
        ),
      ],
    );
  }
}
