import '../../widgets.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  void initState() {
    super.initState();
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();
  bool isConnected = true;

  void _handleConnectivityChanged() {
    setState(() {
      isConnected = _connectivityUtils.isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.03),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    customText(
                        context: context,
                        text: 'Billing methods',
                        letterSpacing: width * 0.0005,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                width: width * 0.99,
                child: ElevatedButton(
                  onPressed: () {
                    ConnectivityUtils()
                        .handleButtonPressed(context, '/addPaymentPage');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: BorderSide(
                            color: AppColor.buttonColor, width: width * 0.005)),
                    elevation: 0,
                  ),
                  child: customText(
                    context: context,
                    text: 'Add a New Billing Method',
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                flex: 0,
                child: Row(
                  children: [
                    customText(
                        context: context,
                        text: 'You have not set up any billing methods yet.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        fontSize: height * 0.02,
                        letterSpacing: width * 0.0008,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
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
