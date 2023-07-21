import '../../widgets.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, notificationSettingsProvider, child) => ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SwitchListTile(
              title: const Text('Allow Notifications'),
              value: notificationSettingsProvider.allowNotifications,
              onChanged: (value) {
                notificationSettingsProvider.setAllowNotifications(value);
              },
            ),
            SwitchListTile(
              title: const Text('Allow Sound'),
              value: notificationSettingsProvider.allowSound,
              onChanged: (value) {
                notificationSettingsProvider.setAllowSound(value);
              },
            ),
            SwitchListTile(
              title: const Text('Allow Vibration'),
              value: notificationSettingsProvider.allowVibration,
              onChanged: (value) {
                notificationSettingsProvider.setAllowVibration(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
