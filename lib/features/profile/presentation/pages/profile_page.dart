import 'package:qa_lint/features/profile/presentation/widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  List<DeviceModel> selectedDevices = [];

  final List<Widget> _pages = [
    const ProfilePageWidget(),
    const DeviceSpecificationPage(),
    const EducationDetailPage(),
    const SocialMediaForm(),
  ];
  final List<String> _tabTitles = [
    'Profile',
    'Devices',
    'Educations',
    'Social Media',
  ];
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: customText(
            context: context,
            text: _tabTitles[provider.selectedIndex],
            color: Colors.white),
        centerTitle: true,
      ),
      backgroundColor: AppColor.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.buttonColor,
        unselectedItemColor: Colors.black,
        currentIndex: provider.selectedIndex,
        onTap: (index) => provider.setSelectedIndex(index),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: 'Educations',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.link),
            label: 'Social Media',
          ),
        ],
      ),
      body: !isConnected
          ? NoInternetAnimation(
              showAnimation: !isConnected,
            )
          : _pages.elementAt(provider.selectedIndex),
    );
  }
}
