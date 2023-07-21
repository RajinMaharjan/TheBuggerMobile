import 'package:flutter/material.dart';
import 'package:qa_lint/features/profile/presentation/provider/education_provider.dart';

class CardEditingMode extends StatelessWidget {
  const CardEditingMode({
    Key? key,
    required this.height,
    required this.educationDetailProvider,
  }) : super(key: key);

  final double height;
  final EducationDetailProvider educationDetailProvider;
  @override
  Widget build(BuildContext context) {
    final selectedEducationDetail =
        educationDetailProvider.selectedEducationDetail!;

    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height * 0.015),
        ),
        margin: EdgeInsets.symmetric(
            horizontal: height * 0.005, vertical: height * 0.01),
        elevation: 7,
        child: Padding(
          padding: EdgeInsets.all(height * 0.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: selectedEducationDetail.education,
                onChanged: (value) {
                  selectedEducationDetail.education = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Education',
                ),
              ),
              SizedBox(height: height * 0.01),
              TextFormField(
                initialValue: selectedEducationDetail.university,
                onChanged: (value) {
                  selectedEducationDetail.university = value;
                },
                decoration: const InputDecoration(
                  labelText: 'University',
                ),
              ),
              SizedBox(height: height * 0.01),
              DropdownButtonFormField<String>(
                value: selectedEducationDetail.course,
                onChanged: (value) {
                  selectedEducationDetail.course = value!;
                },
                items:
                    educationDetailProvider.options.courseOptions.map((course) {
                  return DropdownMenuItem<String>(
                    value: course,
                    child: Text(course),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Course',
                ),
              ),
              SizedBox(height: height * 0.01),
              DropdownButtonFormField<String>(
                value: selectedEducationDetail.specialization,
                onChanged: (value) {
                  selectedEducationDetail.specialization = value!;
                },
                items: educationDetailProvider.options.specializationOptions
                    .map((specialization) {
                  return DropdownMenuItem<String>(
                    value: specialization,
                    child: Text(specialization),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Specialization',
                ),
              ),
              SizedBox(height: height * 0.01),
              DropdownButtonFormField<String>(
                value: selectedEducationDetail.startYear,
                onChanged: (value) {
                  selectedEducationDetail.startYear = value!;
                },
                items: educationDetailProvider.years.map((year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Start Year',
                ),
              ),
              SizedBox(height: height * 0.01),
              DropdownButtonFormField<String>(
                value: selectedEducationDetail.endYear,
                onChanged: (value) {
                  selectedEducationDetail.endYear = value!;
                },
                items: educationDetailProvider.years.map((year) {
                  return DropdownMenuItem<String>(
                    value: year,
                    child: Text(year),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'End Year',
                ),
              ),
              SizedBox(height: height * 0.01),
              DropdownButtonFormField<String>(
                value: selectedEducationDetail.gradingSystem,
                onChanged: (value) {
                  selectedEducationDetail.gradingSystem = value!;
                },
                items: educationDetailProvider.options.gradingOptions
                    .map((gradingSystem) {
                  return DropdownMenuItem<String>(
                    value: gradingSystem,
                    child: Text(gradingSystem),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Grading System',
                ),
              ),
              SizedBox(height: height * 0.01),
              DropdownButtonFormField<String>(
                value: selectedEducationDetail.grade,
                onChanged: (value) {
                  selectedEducationDetail.grade = value!;
                },
                items: educationDetailProvider.options.marks.map((marks) {
                  return DropdownMenuItem<String>(
                    value: marks,
                    child: Text(marks),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Grade/Marks',
                ),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      educationDetailProvider.saveEditedInformation(context);
                      // Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      educationDetailProvider.saveEditedInformation(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
