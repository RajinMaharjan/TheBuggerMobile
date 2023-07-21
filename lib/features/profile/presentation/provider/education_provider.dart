import 'package:qa_lint/features/addtional_information/presentation/widgets.dart';
import 'package:qa_lint/features/profile/data/model/education_detail_model.dart';
import 'package:qa_lint/features/profile/data/model/education_options_model.dart';

class EducationDetailProvider extends ChangeNotifier {
  TextEditingController universityController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  EducationDetailController educationController = EducationDetailController();

  TextEditingController specializationController = TextEditingController();
  List<EducationDetailModel> educationDetails = [];

  bool showTextField = true;

  String? selectedCourse;
  String? selectedEducation;
  String? selectedSpecialization;
  String? selectedStartYear;
  String? selectedEndYear;
  String? selectedGradingSystem;
  String? selectedGrade;

  final Options options = Options();

  void addMore() {
    showTextField = true;
    notifyListeners();
  }

  bool validateFields() {
    return selectedEducation != null &&
        universityController.text.isNotEmpty &&
        selectedCourse != null &&
        selectedSpecialization != null &&
        selectedStartYear != null &&
        selectedEndYear != null &&
        selectedGradingSystem != null &&
        selectedGrade != null;
  }

  void saveInformation(BuildContext context) {
    String university = universityController.text;
    if (university.isEmpty ||
        selectedCourse == null ||
        selectedSpecialization == null ||
        selectedStartYear == null ||
        selectedEndYear == null ||
        selectedGradingSystem == null ||
        selectedEducation == null ||
        selectedGrade == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incomplete Information'),
            content: const Text('Please fill all the fields.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    educationDetails.add(EducationDetailModel(
      education: selectedEducation!,
      university: university,
      course: selectedCourse!,
      specialization: selectedSpecialization!,
      startYear: selectedStartYear!,
      endYear: selectedEndYear!,
      gradingSystem: selectedGradingSystem!,
      grade: selectedGrade!,
    ));
    universityController.clear();
    selectedCourse = null;
    selectedSpecialization = null;
    selectedStartYear = null;
    selectedEndYear = null;
    selectedGradingSystem = null;
    selectedGrade = null;
    showTextField = false;

    notifyListeners();
  }

  List<String> years = List.generate(82, (index) => (1940 + index).toString());

  EducationDetailModel? _selectedEducationDetail;

  EducationDetailModel? get selectedEducationDetail => _selectedEducationDetail;

  void startEditing(EducationDetailModel educationDetail) {
    _selectedEducationDetail = educationDetail;
    notifyListeners();
  }

  void deleteSavedEducation(EducationDetailModel educationDetailModel) {
    educationDetails.remove(educationDetailModel);
    notifyListeners();
  }

  void saveEditedInformation(BuildContext context) {
    if (_selectedEducationDetail == null ||
        _selectedEducationDetail!.education.isEmpty ||
        _selectedEducationDetail!.university.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Incomplete Information'),
            content: const Text('Please fill all the fields.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    final index = educationDetails.indexOf(_selectedEducationDetail!);
    educationDetails[index] = _selectedEducationDetail!;
    _selectedEducationDetail = null;

    notifyListeners();
  }
}
