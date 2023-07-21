import '../../widgets.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  void initState() {
    super.initState();
    // Initialize the showFullDescriptionList when the widget is created
    final projectListProvider =
        Provider.of<ProjectListProvider>(context, listen: false);
    final projectProvider =
        Provider.of<ProjectProvider>(context, listen: false);
    final numberOfProjects = projectListProvider.projects.length;
    projectProvider.initializeShowFullDescriptionList(numberOfProjects);
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();
  final TextEditingController _searchEditingController =
      TextEditingController();
  bool isConnected = true;

  void _handleConnectivityChanged() {
    setState(() {
      isConnected = _connectivityUtils.isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    final projectListProvider = Provider.of<ProjectListProvider>(context);
    final projectProvider = Provider.of<ProjectProvider>(context);
    final filteredProjects = projectListProvider.projects.where((project) {
      final projectName = project.title.toLowerCase();
      final query = projectProvider.searchQuery.toLowerCase();
      return projectName.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: !isConnected
          ? NoInternetAnimation(
              showAnimation: !isConnected,
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(height * 0.005),
                  child: customTextFormField(
                    context: context,
                    onChanged: (value) {
                      projectProvider.setSearchQuery(value);
                    },
                    labelText: 'Search',
                    controller: _searchEditingController,
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                const Divider(
                  color: AppColor.titleTextColor,
                  thickness: 0.5,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: filteredProjects.length,
                    itemBuilder: (context, index) {
                      final startDate = filteredProjects[index].startDate;
                      final endDate = filteredProjects[index].endDate;
                      final deviceRequired =
                          filteredProjects[index].deviceRequirements;
                      final payment = filteredProjects[index].payment;
                      final createdAt = filteredProjects[index].createdAt;
                      final title = filteredProjects[index].title;
                      final description = filteredProjects[index].description;
                      return buildProjectList(
                        onTap: () {
                          projectProvider.setCurrentProjectIndex(index);
                          ConnectivityUtils().handleButtonPressed(
                              context, '/projectDescriptionPage');
                        },
                        context: context,
                        startDate: startDate,
                        endDate: endDate,
                        projectListProvider: projectListProvider,
                        deviceRequired: deviceRequired,
                        payment: payment,
                        createdAt: createdAt,
                        title: title,
                        index: index,
                        projectProvider: projectProvider,
                        description: description,
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _searchEditingController.dispose();
    _connectivityUtils.disposeConnectivity();
    super.dispose();
  }
}
