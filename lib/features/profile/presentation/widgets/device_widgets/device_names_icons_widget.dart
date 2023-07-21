import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/presentation/provider/device_provider.dart';

class DeviceIconAndNames extends StatelessWidget {
  const DeviceIconAndNames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    return Consumer<DeviceProvider>(
      builder: (context, provider, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.6,
            crossAxisCount: 2,
          ),
          itemCount: provider.devices.length,
          itemBuilder: (context, index) {
            final deviceNames = provider.devices[index].name;
            final deviceIcons = provider.devices[index].icon;
            final isSelected = provider.selectedDeviceIndex == index;
            return InkWell(
              onTap: () {
                provider.setSelectedDeviceIndex(index);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: height * 0.02,
                        ),
                        height: height * 0.1,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(height * 0.01),
                          border: Border.all(
                              color: isSelected ? Colors.green : Colors.black,
                              width: isSelected ? 3 : 0.5),
                        ),
                        child: Icon(deviceIcons),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  customText(context: context, text: deviceNames),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
