import '../../widgets.dart';

class ProjectDescriptionPage extends StatefulWidget {
  const ProjectDescriptionPage({super.key});

  @override
  State<ProjectDescriptionPage> createState() => _ProjectDescriptionPageState();
}

class _ProjectDescriptionPageState extends State<ProjectDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    final projectListProvider = Provider.of<ProjectListProvider>(context);
    final projectProvider = Provider.of<ProjectProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text('Project Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(height * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                  context: context,
                  text: projectListProvider
                      .projects[projectProvider.currentProjectIndex].title,
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.03,
                  color: AppColor.titleTextColor),
              SizedBox(height: height * 0.02),
              customText(
                  context: context,
                  text: projectListProvider
                      .projects[projectProvider.currentProjectIndex].typeOfJob,
                  color: Colors.green),
              customText(
                  context: context,
                  text:
                      'posted ${projectListProvider.projects[projectProvider.currentProjectIndex].createdAt.hour} hours ago',
                  color: AppColor.titleTextColor),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
              customText(
                  context: context,
                  text: 'Description:',
                  color: AppColor.titleTextColor),
              SizedBox(height: height * 0.008),
              customText(
                  context: context,
                  text: projectListProvider
                      .projects[projectProvider.currentProjectIndex]
                      .description,
                  color: AppColor.titleTextColor),
              SizedBox(height: height * 0.016),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customText(
                          context: context,
                          text:
                              'Start Date\n${projectListProvider.projects[projectProvider.currentProjectIndex].startDate.day}/${projectListProvider.projects[projectProvider.currentProjectIndex].startDate.month}/${projectListProvider.projects[projectProvider.currentProjectIndex].startDate.year}',
                          color: AppColor.titleTextColor),
                      SizedBox(
                        width: width * 0.275,
                      ),
                      customText(
                          context: context,
                          text:
                              'End Date\n${projectListProvider.projects[projectProvider.currentProjectIndex].endDate.day}/${projectListProvider.projects[projectProvider.currentProjectIndex].endDate.month}/${projectListProvider.projects[projectProvider.currentProjectIndex].endDate.year}',
                          color: AppColor.titleTextColor),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Row(
                    children: [
                      customText(
                          overflow: TextOverflow.ellipsis,
                          context: context,
                          text:
                              'Payment\nRs.${projectListProvider.projects[projectProvider.currentProjectIndex].payment}',
                          color: AppColor.titleTextColor),
                      SizedBox(
                        width: width * 0.3,
                      ),
                      Expanded(
                        child: customText(
                            context: context,
                            overflow: TextOverflow.ellipsis,
                            text:
                                'Device Required\n${projectListProvider.projects[projectProvider.currentProjectIndex].deviceRequirements}',
                            color: AppColor.titleTextColor),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      customText(
                          context: context,
                          text:
                              'Domain:\n${projectListProvider.projects[projectProvider.currentProjectIndex].domain}',
                          color: AppColor.titleTextColor),
                      SizedBox(
                        width: width * 0.25,
                      ),
                      Expanded(
                        child: customText(
                            context: context,
                            overflow: TextOverflow.ellipsis,
                            text:
                                'Area of Scope:\n${projectListProvider.projects[projectProvider.currentProjectIndex].areaOfScope}',
                            color: AppColor.titleTextColor),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () => projectProvider.launchInBrowser(
                          projectListProvider
                              .projects[projectProvider.currentProjectIndex]
                              .link),
                      child: customText(
                          context: context,
                          text:
                              'URL link for testing:\n${projectListProvider.projects[projectProvider.currentProjectIndex].link}',
                          color: AppColor.titleTextColor))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColor.buttonColor,
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: customText(
                context: context, text: 'Start', color: Colors.white)),
      ),
    );
  }
}
