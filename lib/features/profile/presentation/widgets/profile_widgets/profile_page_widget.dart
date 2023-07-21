import 'package:qa_lint/features/profile/presentation/widget.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePageWidget> {
  final CustomImageProvider _imageProvider = CustomImageProvider();

  Future<void> _pickImage(CustomImageProvider provider) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final selectedImage = File(pickedImage.path);
      provider.setImage(selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileBasicDetailProvider>(context);
    final int percentage = provider.calculatePercentage();
    double height = mediaQueryHeight(context);
    double width = mediaQueryWidth(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Stack(
            children: [
              CircleAvatar(
                backgroundImage: _imageProvider.selectedImageFile != null
                    ? FileImage(_imageProvider.selectedImageFile!)
                    : const AssetImage(ImagePath.googleLogo)
                        as ImageProvider<Object>,
                radius: height * 0.075,
              ),
              Positioned(
                bottom: 0,
                left: height * 0.1,
                height: height * 0.06,
                width: width * 0.1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white60, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 25,
                      color: Colors.black,
                    ),
                    onPressed: () => _pickImage(_imageProvider),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          customText(
              context: context,
              text: 'Pradeep Tharu',
              color: AppColor.titleTextColor),
          SizedBox(
            height: height * 0.01,
          ),
          customText(
              context: context,
              text: 'Software Engineer',
              color: AppColor.titleTextColor),
          customText(
              context: context,
              text: 'Kathmandu University',
              color: AppColor.titleTextColor),
          SizedBox(
            height: height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.023),
            child: FAProgressBar(
              displayTextStyle:
                  const TextStyle(letterSpacing: 2, color: Colors.white),
              size: height * 0.025,
              currentValue: percentage.toDouble(),
              displayText: '%',
              backgroundColor: Colors.blue,
              progressColor: Colors.green,
            ),
          ),

          SizedBox(
            height: height * 0.02,
          ),
          const ProfileBasicDetailWidget(),
          // Resume headline
          SizedBox(
            height: height * 0.02,
          ),
          const ProfileDetailWidget(),
        ],
      ),
    );
  }
}
