import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:qa_lint/core/utils/constants/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationBarProvider = Provider.of<HomePageProvider>(context);
    double height = mediaQueryHeight(context);
    int selectedIndex = bottomNavigationBarProvider.getSelectedIndex;
    final List<Widget> widgetOptions = bottomNavigationBarProvider.pages;

    // ignore: no_leading_underscores_for_local_identifiers
    void _onItemTapped(int index) {
      bottomNavigationBarProvider.setSelectedIndex(index);
    }

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(bottomNavigationBarProvider.appBarTitle[selectedIndex]),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profilePage');
            },
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              margin: EdgeInsets.symmetric(horizontal: height * 0.02),
              child: Icon(
                Icons.person,
                size: height * 0.04,
              ),
            ),
          ),
        ],
      ),
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.buttonColor,
        unselectedItemColor: Colors.black54,
        currentIndex: bottomNavigationBarProvider.getSelectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
