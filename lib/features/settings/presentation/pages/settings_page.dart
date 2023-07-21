import 'package:qa_lint/features/login/data/datasources/login_data_source.dart';
import '../../widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();

  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  void _handleConnectivityChanged() {
    setState(() {
      isConnected = _connectivityUtils.isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                  context: context,
                  text: 'User settings',
                  color: Colors.grey[600]),
              SizedBox(
                height: height * 0.025,
              ),
              ListTile(
                leading:
                    const Icon(Icons.key_outlined, color: AppColor.buttonColor),
                title: customText(
                  context: context,
                  text: 'Change password',
                  color: AppColor.buttonColor,
                ),
                onTap: () {
                  ConnectivityUtils()
                      .handleButtonPressed(context, '/changePasswordPage');
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications,
                    color: AppColor.buttonColor),
                title: customText(
                  context: context,
                  text: 'Notification settings',
                  color: AppColor.buttonColor,
                ),
                onTap: () {
                  ConnectivityUtils().handleButtonPressed(
                      context, '/notificationSettingsPage');
                },
              ),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
              customText(
                  context: context, text: 'Legal', color: Colors.grey[600]),
              SizedBox(
                height: height * 0.025,
              ),
              ListTile(
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.black,
                ),
                title: customText(
                    context: context,
                    text: 'Privacy policy',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                trailing: IconButton(
                  onPressed: () =>
                      settingsProvider.launchPrivacyPolicyInBrowser(
                          settingsProvider.privacyPolicyUrl),
                  icon: const Icon(
                    Icons.open_in_browser,
                    color: AppColor.buttonColor,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              ListTile(
                leading: const Icon(
                  Icons.accessible_forward_rounded,
                  color: Colors.black,
                ),
                title: customText(
                    context: context,
                    text: 'Accessibility',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                trailing: IconButton(
                  onPressed: () =>
                      settingsProvider.launchAccessibilityInBrowser(
                          settingsProvider.accessibilityUrl),
                  icon: const Icon(
                    Icons.open_in_browser,
                    color: AppColor.buttonColor,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              ListTile(
                leading: const Icon(
                  Icons.receipt_outlined,
                  color: Colors.black,
                ),
                title: customText(
                    context: context,
                    text: 'Terms of Service',
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                trailing: IconButton(
                  onPressed: () =>
                      settingsProvider.launchTermsOfServiceInBrowser(
                          settingsProvider.termsOfServiceUrl),
                  icon: const Icon(
                    Icons.open_in_browser,
                    color: AppColor.buttonColor,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.25,
              ),
              Center(
                child: SizedBox(
                  width: width * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(
                                color: AppColor.buttonColor,
                                width: width * 0.005)),
                        elevation: 0,
                      ),
                      onPressed: () {
                        LoginService().logout();
                        ConnectivityUtils()
                            .handleButtonPressed(context, '/loginpage');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout,
                            color: AppColor.buttonColor,
                          ),
                          customText(
                              context: context,
                              text: 'Logout',
                              color: AppColor.buttonColor),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _connectivityUtils.disposeConnectivity();
    super.dispose();
  }
}
