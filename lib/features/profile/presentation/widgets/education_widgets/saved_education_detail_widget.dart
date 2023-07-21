import 'package:qa_lint/features/addtional_information/presentation/widgets.dart';
import 'package:qa_lint/features/profile/presentation/provider/education_provider.dart';

class EducationSavedDetailWidget extends StatelessWidget {
  const EducationSavedDetailWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final educationDetailProvider =
        Provider.of<EducationDetailProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Educations'),
          items:
              educationDetailProvider.options.educationOptions.map((education) {
            return DropdownMenuItem<String>(
              value: education,
              child: customText(context: context, text: education),
            );
          }).toList(),
          onChanged: (value) {
            educationDetailProvider.selectedEducation = value;
          },
        ),
        TextFormField(
          controller: educationDetailProvider.universityController,
          decoration: const InputDecoration(
            labelText: 'University',
          ),
        ),
        const SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          value: educationDetailProvider.selectedCourse,
          onChanged: (value) {
            educationDetailProvider.selectedCourse = value!;
          },
          items: educationDetailProvider.options.courseOptions.map((course) {
            return DropdownMenuItem<String>(
              value: course,
              child: customText(context: context, text: course),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Course',
          ),
        ),
        DropdownButtonFormField<String>(
          value: educationDetailProvider.selectedSpecialization,
          onChanged: (value) {
            educationDetailProvider.selectedSpecialization = value!;
          },
          items: educationDetailProvider.options.specializationOptions
              .map((specialization) {
            return DropdownMenuItem<String>(
              value: specialization,
              child: customText(context: context, text: specialization),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Specialization',
          ),
        ),
        DropdownButtonFormField<String>(
          value: educationDetailProvider.selectedStartYear,
          onChanged: (value) {
            educationDetailProvider.selectedStartYear = value!;
          },
          items: educationDetailProvider.years.map((year) {
            return DropdownMenuItem<String>(
              value: year,
              child: customText(context: context, text: year),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Start Year',
          ),
        ),
        DropdownButtonFormField<String>(
          value: educationDetailProvider.selectedEndYear,
          onChanged: (value) {
            educationDetailProvider.selectedEndYear = value!;
          },
          items: educationDetailProvider.years.map((year) {
            return DropdownMenuItem<String>(
              value: year,
              child: customText(context: context, text: year),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'End Year',
          ),
        ),
        DropdownButtonFormField<String>(
          value: educationDetailProvider.selectedGradingSystem,
          onChanged: (value) {
            educationDetailProvider.selectedGradingSystem = value!;
          },
          items: educationDetailProvider.options.gradingOptions
              .map((gradingSystem) {
            return DropdownMenuItem<String>(
              value: gradingSystem,
              child: customText(context: context, text: gradingSystem),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Grading System',
          ),
        ),
        DropdownButtonFormField<String>(
          value: educationDetailProvider.selectedGrade,
          onChanged: (value) {
            educationDetailProvider.selectedGrade = value!;
          },
          items: educationDetailProvider.options.marks.map((marks) {
            return DropdownMenuItem<String>(
              value: marks,
              child: customText(context: context, text: marks),
            );
          }).toList(),
          decoration: const InputDecoration(
            labelText: 'Grade/Marks',
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(width * 0.3, height * 0.05)),
              child: customText(
                  context: context, text: 'Cancel', color: Colors.white),
              onPressed: () {},
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width * 0.3, height * 0.05),
              ),
              child: customText(
                  context: context, text: 'Save', color: Colors.white),
              onPressed: () {
                if (educationDetailProvider.selectedEducationDetail == null) {
                  educationDetailProvider.saveInformation(context);
                } else {
                  educationDetailProvider.saveEditedInformation(context);
                }
              },
            ),
          ],
        ),
        SizedBox(height: height * 0.016),
      ],
    );
  }
}
