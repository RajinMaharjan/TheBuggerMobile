import 'package:qa_lint/features/addtional_information/presentation/widgets.dart';
import 'addtional_custom_text_form_filed_widget.dart';

class PersonalTextField extends StatelessWidget {
  const PersonalTextField({
    super.key,
    required this.validator,
    required this.personalDetailController,
  });

  final Validator validator;
  final PersonalDetailController personalDetailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.person,
          context: context,
          labelText: 'First Name',
          validator: validator.firstNameValidator,
          controller: personalDetailController.firstNameController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.person,
          context: context,
          labelText: 'Last Name',
          validator: validator.lastNameValidator,
          controller: personalDetailController.lastNameController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.email,
          context: context,
          labelText: 'Email Address',
          validator: validator.emailValidator,
          controller: personalDetailController.emailController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.phone,
          context: context,
          labelText: 'Phone Number',
          validator: validator.phoneNumberValidator,
          controller: personalDetailController.phoneNumberController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.credit_card,
          context: context,
          labelText: 'National ID',
          validator: validator.nationalIdValidator,
          controller: personalDetailController.nationalIdController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.location_city,
          context: context,
          labelText: 'Address',
          validator: validator.addressValidator,
          controller: personalDetailController.addressController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.next,
          prefixIcon: Icons.g_mobiledata,
          context: context,
          labelText: 'GitHub URL',
          controller: personalDetailController.githubLinkController,
        ),
        customAdditionalTextFormField(
          textInputAction: TextInputAction.done,
          prefixIcon: Icons.link,
          context: context,
          labelText: 'LinkedIn URL',
          controller: personalDetailController.linkedinLinkController,
        ),
      ],
    );
  }
}
