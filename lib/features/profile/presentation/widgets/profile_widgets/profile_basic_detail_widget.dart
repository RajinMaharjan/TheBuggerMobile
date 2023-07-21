import 'package:qa_lint/features/profile/presentation/widgets/profile_widgets/editable_basic_details_widget.dart';

import '../../widget.dart';

class ProfileBasicDetailWidget extends StatelessWidget {
  const ProfileBasicDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    return Card(
      color: AppColor.backgroundColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(height * 0.012),
      ),
      margin: EdgeInsets.symmetric(horizontal: height * 0.02),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Consumer<ProfileBasicDetailProvider>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText(
                      context: context,
                      text: 'Basic details',
                      fontSize: height * 0.03,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white54,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () =>
                            provider.setEditMode(!provider.isEditMode),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Visibility(
                  visible: !provider.isEditMode,
                  child: Column(
                    children: [
                      provider.basicDetails(
                        context,
                        icon: Icons.location_on,
                        text: provider.locationController.text.isNotEmpty
                            ? provider.locationController.text
                            : 'No Location',
                      ),
                      SizedBox(height: height * 0.02),
                      provider.basicDetails(
                        context,
                        icon: Icons.work,
                        text: provider.workController.text.isNotEmpty
                            ? provider.workController.text
                            : 'No Experience',
                      ),
                      SizedBox(height: height * 0.02),
                      provider.basicDetails(
                        context,
                        icon: Icons.email,
                        text: provider.emailController.text.isNotEmpty
                            ? provider.emailController.text
                            : 'pradeep@vurilo.com',
                      ),
                      SizedBox(height: height * 0.02),
                      provider.basicDetails(
                        context,
                        icon: Icons.phone,
                        text: provider.phoneController.text.isNotEmpty
                            ? provider.phoneController.text
                            : 'Please enter phone number',
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
                Visibility(
                  visible: provider.isEditMode,
                  child: Column(
                    children: [
                      editableBasicDetails(
                        context: context,
                        controller: provider.locationController,
                        icon: Icons.location_on,
                        labelText: 'Location',
                      ),
                      SizedBox(height: height * 0.02),
                      editableBasicDetails(
                        context: context,
                        controller: provider.workController,
                        icon: Icons.work,
                        labelText: 'Experience',
                      ),
                      SizedBox(height: height * 0.02),
                      editableBasicDetails(
                        context: context,
                        controller: provider.emailController,
                        icon: Icons.email,
                        labelText: 'Email',
                      ),
                      SizedBox(height: height * 0.02),
                      editableBasicDetails(
                        context: context,
                        controller: provider.phoneController,
                        icon: Icons.phone,
                        labelText: 'Phone',
                      ),
                      SizedBox(height: height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: provider.saveData,
                              child: const Text('Save'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
