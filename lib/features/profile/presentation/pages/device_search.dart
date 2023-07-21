import 'package:flutter/cupertino.dart';
import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/profile/data/model/device_model.dart';
import 'package:qa_lint/features/profile/data/model/mobile_brand_name_model.dart';
import 'package:qa_lint/features/profile/presentation/provider/device_provider.dart';
import 'package:qa_lint/features/profile/presentation/widgets/device_widgets/add_device_button_container_widget.dart';
import 'package:qa_lint/features/profile/presentation/widgets/device_widgets/device_names_icons_widget.dart';

class AddDevicesWidget extends StatefulWidget {
  const AddDevicesWidget(
      {Key? key, required this.selectedDevices, required this.onDeviceAdded})
      : super(key: key);

  final List<DeviceModel> selectedDevices;
  final void Function(DeviceModel) onDeviceAdded;

  @override
  State<AddDevicesWidget> createState() => _AddDevicesWidgetState();
}

class _AddDevicesWidgetState extends State<AddDevicesWidget> {
  TextEditingController deviceNameController = TextEditingController();
  List<String> filteredBrands = [];
  MobileBrands mobileBrands = MobileBrands();

  @override
  void dispose() {
    deviceNameController.dispose();
    super.dispose();
  }

  void addDevice() {
    final deviceName = deviceNameController.text.trim();
    final provider = Provider.of<DeviceProvider>(context, listen: false);
    if (deviceName.isNotEmpty) {
      final selectedDevice = provider.devices[provider.selectedDeviceIndex];
      final newDevice =
          DeviceModel(name: deviceName, icon: selectedDevice.icon);
      widget.onDeviceAdded(newDevice);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DeviceProvider>(
      context,
    );

    final height = mediaQueryHeight(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customText(
            context: context,
            text: 'Add a device',
            fontSize: height * 0.04,
          ),
          customText(
            context: context,
            text: 'Category',
          ),
          SizedBox(height: height * 0.02),
          const Expanded(
            child: DeviceIconAndNames(),
          ),
          customTextFormField(
            suffixIcon: IconButton(
              onPressed: () {
                deviceNameController.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            context: context,
            labelText: 'Device name',
            controller: deviceNameController,
            prefixIcon: Icons.devices,
            onChanged: (query) {
              provider.matchedBrand(query);
            },
            onTap: () {
              provider.matchedBrand(provider.selectedBrands);
              provider.clearSearch();
            },
          ),
          if (deviceNameController.text.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 50,
                  childAspectRatio: 3.0,
                ),
                itemCount: provider.filteredBrands.length,
                itemBuilder: (context, index) {
                  final brand = provider.filteredBrands[index];
                  return GestureDetector(
                    onTap: () {
                      deviceNameController.text = brand;
                      provider.clearDevices();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      ),
                      child: provider.filteredBrands.isEmpty
                          ? Center(
                              child: customText(
                                context: context,
                                text: 'Device is Not Found',
                              ),
                            )
                          : Text(brand),
                    ),
                  );
                },
              ),
            ),
          SizedBox(height: height * 0.02),
          SizedBox(height: height * 0.02),
          Container(
            height: height * 0.1,
            color: AppColor.buttonColor,
            child: Row(
              children: [
                ButtonContainer(
                  icon: CupertinoIcons.xmark,
                  label: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ButtonContainer(
                  icon: Icons.done,
                  label: 'Add device',
                  onPressed: addDevice,
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.00),
        ],
      ),
    );
  }
}
