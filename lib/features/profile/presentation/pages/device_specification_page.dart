import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/data/model/device_model.dart';
import 'package:qa_lint/features/profile/presentation/provider/device_provider.dart';
import 'package:qa_lint/features/profile/presentation/widgets/device_widgets/add_devices_widget.dart';

class DeviceSpecificationPage extends StatefulWidget {
  const DeviceSpecificationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DeviceSpecificationPage> createState() =>
      _DeviceSpecificationPageState();
}

class _DeviceSpecificationPageState extends State<DeviceSpecificationPage> {
  List<DeviceModel> selectedDevices = [];
  bool showDevices = false;
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
  void dispose() {
    _connectivityUtils.disposeConnectivity();
    super.dispose();
  }

  void _showAddedDevices(BuildContext context, DeviceModel device) {
    final deviceProvider = Provider.of<DeviceProvider>(context, listen: false);
    deviceProvider.addDevice(device);
  }

  void _deleteDevice(int index, BuildContext context) {
    final deviceProvider = Provider.of<DeviceProvider>(context, listen: false);
    deviceProvider.removeDeviceByIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    final deviceProvider = Provider.of<DeviceProvider>(context);
    final selectedDevices = deviceProvider.selectedDevices;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedDevices.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                child: customText(
                  context: context,
                  text: 'Add Devices',
                  fontSize: height * 0.04,
                  color: Colors.black,
                ),
              ),
            SizedBox(height: height * 0.01),
            if (selectedDevices.isEmpty)
              Container(
                margin: EdgeInsets.symmetric(horizontal: height * 0.02),
                padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.01),
                  border: Border.all(color: Colors.black54),
                ),
                width: height * 0.18,
                height: height * 0.18,
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: height * 0.07,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDevicesWidget(
                            selectedDevices: selectedDevices,
                            onDeviceAdded: (device) =>
                                _showAddedDevices(context, device)),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: height * 0.02),
            if (selectedDevices.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.02),
                    child: customText(
                      context: context,
                      text: 'Added Devices',
                      fontSize: height * 0.025,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    margin: EdgeInsets.symmetric(horizontal: height * 0.015),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(height * 0.02),
                      border: Border.all(color: Colors.white),
                    ),
                    height: height * 0.6,
                    child: ListView.builder(
                      itemCount: selectedDevices.length,
                      itemBuilder: (context, index) {
                        final device = selectedDevices[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: height * 0.01),
                          child: Container(
                            padding: EdgeInsets.all(height * 0.01),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(height * 0.012),
                              border: Border.all(color: Colors.black),
                            ),
                            height: height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Icon(
                                    device.icon,
                                    size: height * 0.08,
                                  ),
                                ),
                                customText(
                                    context: context,
                                    text: device.name,
                                    fontSize: height * 0.03),
                                IconButton(
                                  onPressed: () {
                                    _deleteDevice(index, context);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    size: height * 0.05,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            SizedBox(height: height * 0.05),
            if (selectedDevices.isNotEmpty)
              Container(
                margin: EdgeInsets.symmetric(horizontal: height * 0.01),
                padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                height: height * 0.05,
                width: width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height * 0.01),
                  border: Border.all(color: Colors.black54),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddDevicesWidget(
                            selectedDevices: selectedDevices,
                            onDeviceAdded: (device) =>
                                _showAddedDevices(context, device)),
                      ),
                    );
                  },
                  splashColor: Colors.grey.shade100,
                  child: Row(
                    children: [
                      const Icon(Icons.add),
                      SizedBox(width: height * 0.01),
                      customText(context: context, text: 'Add a device'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
