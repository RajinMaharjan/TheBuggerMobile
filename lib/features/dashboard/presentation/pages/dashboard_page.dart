import 'package:qa_lint/features/dashboard/presentation/widgets.dart';

import '../../../../core/utils/custom_widgets/no_internet_animation_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  void _handleConnectivityChanged() {
    setState(() {
      // Handle the changes in connectivity state here
      isConnected = _connectivityUtils.isConnected;
    });
  }

  @override
  void dispose() {
    _connectivityUtils.disposeConnectivity();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    final projectProvider = Provider.of<ProjectProvider>(context);
    return !isConnected
        ? NoInternetAnimation(
            showAnimation: !isConnected,
          )
        : SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  buildContainer(
                      onTap: () {
                        // ConnectivityUtils()
                        //     .handleButtonPressed(context, '/projectPage');
                      },
                      context: context,
                      icon: Icons.insert_drive_file_sharp,
                      title: 'Total Projects',
                      subtitle: 'Projects',
                      count: 10),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  buildContainer(
                      onTap: () {
                        // ConnectivityUtils()
                        //     .handleButtonPressed(context, '/projectPage');
                      },
                      context: context,
                      icon: Icons.book,
                      title: 'Active Projects',
                      subtitle: 'running',
                      count: 5),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  buildContainer(
                    onTap: () {
                      // ConnectivityUtils()
                      //     .handleButtonPressed(context, '/projectPage');
                    },
                    context: context,
                    icon: Icons.done_all,
                    title: 'Completed Projects',
                    subtitle: 'Projects',
                    count: 12,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: customText(
                        context: context,
                        text: 'My Projects',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.03),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Expanded(
                    child: Consumer<ProjectListProvider>(
                      builder: (context, provider, child) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: provider.projects.length,
                          itemBuilder: (context, index) {
                            final image = provider.projects[index].image;
                            final title = provider.projects[index].title;
                            final discription =
                                provider.projects[index].description;
                            return buildProjectList(
                              onTap: () {
                                projectProvider.setCurrentProjectIndex(index);
                                ConnectivityUtils().handleButtonPressed(
                                    context, '/projectDescriptionPage');
                              },
                              context: context,
                              image: image,
                              title: title,
                              discription: discription,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
