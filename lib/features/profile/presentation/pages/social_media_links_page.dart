import 'package:qa_lint/features/profile/presentation/widget.dart';

class SocialMediaForm extends StatefulWidget {
  const SocialMediaForm({super.key});

  @override
  State<SocialMediaForm> createState() => _SocialMediaFormState();
}

class _SocialMediaFormState extends State<SocialMediaForm> {
  final ProfileTextEditingController _controller =
      ProfileTextEditingController();
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

  bool isEditing = true;

  void saveData() {
    setState(() {
      isEditing = false;
    });
  }

  void editData() {
    setState(() {
      isEditing = true;
    });
  }

  void _openUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
    } else {
      print('Error: Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    return Column(
      children: [
        SizedBox(
          height: height * 0.02,
        ),
        _buildSocialMediaLink(
          controller: _controller.linkedinController,
          icon: EvaIcons.linkedin,
          label: 'LinkedIn',
        ),
        SizedBox(height: height * 0.02),
        _buildSocialMediaLink(
          controller: _controller.facebookController,
          icon: EvaIcons.facebook,
          label: 'Facebook',
        ),
        SizedBox(height: height * 0.02),
        _buildSocialMediaLink(
          controller: _controller.githubController,
          icon: EvaIcons.github,
          label: 'GitHub',
        ),
        SizedBox(height: height * 0.02),
        _buildSocialMediaLink(
          controller: _controller.twitterContoller,
          icon: EvaIcons.twitter,
          label: 'Twitter',
        ),
        SizedBox(height: height * 0.02),
        if (isEditing)
          CustomButton(
            onPressed: saveData,
            text: 'Save',
          )
        else
          CustomButton(
            onPressed: editData,
            text: 'Edit',
          ),
      ],
    );
  }

  Widget _buildSocialMediaLink({
    required TextEditingController controller,
    required IconData icon,
    required String label,
  }) {
    double height = mediaQueryHeight(context);

    return InkWell(
      onTap: () {
        if (!isEditing) {
          String url = controller.text.trim();
          if (url.isNotEmpty) {
            _openUrl(url);
          }
        }
      },
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: false,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: height * 0.016),
          labelText: label,
          prefixIcon: Icon(icon),
        ),
        enabled: isEditing,
        readOnly: !isEditing,
      ),
    );
  }

  @override
  void dispose() {
    _connectivityUtils.disposeConnectivity();
    super.dispose();
  }
}
