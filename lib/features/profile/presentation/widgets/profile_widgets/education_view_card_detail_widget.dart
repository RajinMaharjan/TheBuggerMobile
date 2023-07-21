import '../../widget.dart';

class CardViewModeWidget extends StatelessWidget {
  const CardViewModeWidget({
    Key? key,
    required this.height,
    required this.educationDetailProvider,
  }) : super(key: key);

  final double height;
  final EducationDetailProvider educationDetailProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.0),
        customText(
          context: context,
          text: 'Saved Education Details:',
        ),
        SizedBox(height: height * 0.02),
        for (var detail in educationDetailProvider.educationDetails)
          SizedBox(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height * 0.015),
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: height * 0.005, vertical: height * 0.01),
              elevation: 7,
              child: GestureDetector(
                onTap: () {
                  educationDetailProvider.startEditing(detail);
                },
                child: Padding(
                  padding: EdgeInsets.all(height * 0.016),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              educationDetailProvider
                                  .deleteSavedEducation(detail);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: height * 0.035,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      customText(
                        context: context,
                        text: 'Education: ${detail.education}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'University: ${detail.university}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'Course: ${detail.course}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'Specialization: ${detail.specialization}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'Start Year: ${detail.startYear}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'End Year: ${detail.endYear}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'Grading System: ${detail.gradingSystem}',
                      ),
                      SizedBox(height: height * 0.01),
                      customText(
                        context: context,
                        text: 'Grade/Marks: ${detail.grade}',
                      ),
                      SizedBox(height: height * 0.01),
                    ],
                  ),
                ),
              ),
            ),
          ),
        SizedBox(height: height * 0.016),
        Center(
          child: CustomButton(
            text: 'Add More',
            onPressed: educationDetailProvider.addMore,
          ),
        ),
        SizedBox(height: height * 0.016),
      ],
    );
  }
}
