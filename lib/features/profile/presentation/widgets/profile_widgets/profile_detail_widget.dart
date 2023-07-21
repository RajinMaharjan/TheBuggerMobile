import 'package:qa_lint/features/profile/data/model/certification_model.dart';
import 'package:qa_lint/features/profile/presentation/widgets/profile_widgets/certification_card_widget.dart';
import '../../widget.dart';

class ProfileDetailWidget extends StatefulWidget {
  const ProfileDetailWidget({Key? key}) : super(key: key);

  @override
  State<ProfileDetailWidget> createState() => _ProfileDetailWidgetState();
}

class _ProfileDetailWidgetState extends State<ProfileDetailWidget> {
  String resumeHeadlineText = '';
  String profileSummaryText = '';
  List<String> keySkills = [];
  List<String> itSkills = [];

  bool isResumeHeadlineAdded = false;
  bool isProfileSummaryAdded = false;
  bool isKeySkillsAdded = false;
  bool isItSkillAdded = false;
  bool isProjectAdded = false;
  bool isEducationAdded = false;
  bool isCertificationsAdded = false;
  List<CertificationData> certifications = [];

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildCard(
            widget: const SizedBox(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResumeHeadlineCardWidget(
                    initialText: resumeHeadlineText,
                    onSubmit: (text) {
                      setState(() {
                        resumeHeadlineText = text;
                        isResumeHeadlineAdded = true;
                      });
                    },
                  ),
                ),
              );
            },
            context: context,
            text: 'Resume headline',
            icon: EvaIcons.edit2Outline,
            isAdded: isResumeHeadlineAdded,
            notMentioned: 'Not mentioned',
            additionalText: isResumeHeadlineAdded
                ? resumeHeadlineText
                : null, // Pass additional text here
          ),
          SizedBox(
            height: height * 0.02,
          ),
          buildCard(
            widget: const SizedBox(),
            context: context,
            text: 'Profile summary',
            icon: EvaIcons.edit2Outline,
            isAdded: isProfileSummaryAdded,
            notMentioned:
                isProfileSummaryAdded ? profileSummaryText : 'Not mentioned',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileSummaryCardWidget(
                    initialText: profileSummaryText,
                    onSubmit: (text) {
                      setState(() {
                        profileSummaryText = text;
                        isProfileSummaryAdded = true;
                      });
                    },
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          buildCard(
            widget: const SizedBox(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeySkillCardPageWidget(
                    initialSkills: keySkills,
                    onSubmit: (skills) {
                      setState(() {
                        keySkills = skills;
                        isKeySkillsAdded = true;
                      });
                    },
                  ),
                ),
              );
            },
            context: context,
            text: 'Key skills',
            icon: EvaIcons.edit2Outline,
            isAdded: isKeySkillsAdded,
            notMentioned: 'Not mentioned',
            additionalText: isKeySkillsAdded ? keySkills.join(', ') : null,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          buildCard(
            widget: const SizedBox(),
            context: context,
            text: 'IT skills',
            icon: EvaIcons.edit2Outline,
            isAdded: isItSkillAdded,
            notMentioned: 'Not mentioned',
            additionalText: isItSkillAdded ? itSkills.join(', ') : null,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InformationTechnologyWidget(
                    initialSkills: itSkills,
                    onSubmit: (itSkill) {
                      setState(() {
                        itSkills = itSkill;
                        isItSkillAdded = true;
                      });
                    },
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          buildCard(
            widget: Column(
              children: [
                for (int i = 0; i < certifications.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CertificationCardWidget(
                                  onSubmit: (certificationData) {
                                    setState(() {
                                      certifications[i] = certificationData;
                                    });
                                  },
                                  initialData: certifications[i],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: height * 0.01,
                            ),
                            alignment: Alignment.centerLeft,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  BorderRadius.circular(height * 0.01),
                            ),
                            width: height * 0.34,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: height * 0.005,
                                ),
                                customText(
                                    context: context,
                                    text:
                                        'Certificate Name: ${certifications[i].name}'),
                                customText(
                                    context: context,
                                    text: 'URL: ${certifications[i].url}'),
                                customText(
                                    context: context,
                                    text:
                                        'Validity: ${certifications[i].startDate} to ${certifications[i].endDate} '),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              certifications.removeAt(i);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            size: height * 0.04,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (certifications.isNotEmpty)
                  Row(
                    children: [
                      SizedBox(
                        width: height * 0.16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: height * 0.06,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.circular(height * 0.03),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CertificationCardWidget(
                                        initialData: null,
                                        onSubmit: (certificationData) {
                                          setState(() {
                                            certifications
                                                .add(certificationData);
                                            isCertificationsAdded = true;
                                          });
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: height * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            context: context,
            text: 'Add Certification',
            icon: certifications.isEmpty ? Icons.add : Icons.add,
            isAdded: isCertificationsAdded,
            notMentioned: certifications.isEmpty ? 'Not mentioned' : '',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CertificationCardWidget(
                    initialData: null,
                    onSubmit: (certificationData) {
                      setState(() {
                        certifications.add(certificationData);
                        isCertificationsAdded = true;
                      });
                    },
                  ),
                ),
              );
            },
          ),
          SizedBox(height: height * 0.02),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
