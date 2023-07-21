import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/data/model/text_editing_controller_model.dart';

class ProfileBasicDetailProvider with ChangeNotifier {
  bool _isEditMode = false;
  final ProfileTextEditingController _controller =
      ProfileTextEditingController();
  bool get isEditMode => _isEditMode;
  TextEditingController get locationController =>
      _controller.locationController;
  TextEditingController get workController => _controller.workController;
  TextEditingController get emailController => _controller.emailController;
  TextEditingController get phoneController => _controller.phoneController;
  TextEditingController get resumeheadLineController =>
      _controller.phoneController;
  TextEditingController get profileSummaryController =>
      _controller.resumeheadLineController;
  TextEditingController get keySkillsContoller =>
      _controller.keySkillsContoller;
  TextEditingController get itSkillsController =>
      _controller.itSkillsController;
  TextEditingController get certificationController =>
      _controller.certificationController;
  TextEditingController get linkedinController =>
      _controller.linkedinController;
  TextEditingController get facebookController =>
      _controller.facebookController;
  TextEditingController get githubController => _controller.githubController;
  TextEditingController get twitterContoller => _controller.twitterContoller;

  void toggleEditMode() {
    _isEditMode = !_isEditMode;
    notifyListeners();
  }

  void saveData() {
    toggleEditMode();
  }

  TextEditingController getTextFieldController(IconData icon) {
    if (icon == Icons.location_on) {
      return _controller.locationController;
    } else if (icon == Icons.work) {
      return _controller.workController;
    } else if (icon == Icons.email) {
      return _controller.emailController;
    } else if (icon == Icons.phone) {
      return _controller.phoneController;
    }
    return TextEditingController();
  }

  Widget basicDetails(BuildContext context,
      {required String text, required IconData icon}) {
    double height = mediaQueryHeight(context);

    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black54,
        ),
        SizedBox(
          width: height * 0.03,
        ),
        _isEditMode
            ? Expanded(
                child: TextFormField(
                  controller: getTextFieldController(icon),
                  decoration: InputDecoration(
                    hintText: text,
                  ),
                ),
              )
            : customText(
                context: context,
                text: text,
                color: Colors.black,
              ),
      ],
    );
  }

  int calculatePercentage() {
    int filledFieldsCount = 0;
    if (locationController.text.isNotEmpty) filledFieldsCount++;
    if (workController.text.isNotEmpty) filledFieldsCount++;
    if (emailController.text.isNotEmpty) filledFieldsCount++;
    if (phoneController.text.isNotEmpty) filledFieldsCount++;
    if (resumeheadLineController.text.isNotEmpty) filledFieldsCount++;
    if (profileSummaryController.text.isNotEmpty) filledFieldsCount++;
    if (keySkillsContoller.text.isNotEmpty) filledFieldsCount++;
    if (itSkillsController.text.isNotEmpty) filledFieldsCount++;
    if (certificationController.text.isNotEmpty) filledFieldsCount++;
    if (linkedinController.text.isNotEmpty) filledFieldsCount++;
    if (facebookController.text.isNotEmpty) filledFieldsCount++;
    if (githubController.text.isNotEmpty) filledFieldsCount++;
    if (twitterContoller.text.isNotEmpty) filledFieldsCount++;

    return (filledFieldsCount / 13 * 100).toInt();
  }

  void setEditMode(bool value) {
    _isEditMode = value;
    notifyListeners();
  }

  void toggleEditingMode() {
    setEditMode(!isEditMode);
  }
}
//