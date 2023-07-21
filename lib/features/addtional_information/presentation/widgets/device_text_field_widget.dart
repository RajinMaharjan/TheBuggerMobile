import 'package:qa_lint/features/addtional_information/presentation/widgets/text_form_field_contoller.dart';
import '../../../../core/utils/constants/exports.dart';
import 'addtional_custom_text_form_filed_widget.dart';

class DeviceTextFieldWidget extends StatelessWidget {
  const DeviceTextFieldWidget({
    super.key,
    required this.validator,
    required this.deviceController,
  });

  final Validator validator;
  final DeviceController deviceController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAdditionalTextFormField(
          prefixIcon: Icons.devices,
          context: context,
          labelText: 'Device Name',
          validator: validator.deviceNameValidator,
          controller: deviceController.deviceNameController,
        ),
        customAdditionalTextFormField(
          prefixIcon: Icons.system_security_update,
          context: context,
          labelText: 'Operating System',
          validator: validator.opretingSystemValidator,
          controller: deviceController.opretingSystemController,
        ),
        customAdditionalTextFormField(
          prefixIcon: Icons.devices_other,
          context: context,
          labelText: 'Device Type',
          controller: deviceController.deviceTypeController,
        ),
      ],
    );
  }
}
