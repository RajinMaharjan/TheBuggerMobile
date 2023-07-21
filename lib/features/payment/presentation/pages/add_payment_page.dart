import 'package:qa_lint/features/payment/presentation/widgets/add_card_payment_widget.dart';

import '../../widgets.dart';

class AddPaymentPage extends StatefulWidget {
  const AddPaymentPage({super.key});

  @override
  State<AddPaymentPage> createState() => _AddPaymentPageState();
}

class _AddPaymentPageState extends State<AddPaymentPage> {
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
    final checkBoxVisibilityProvider =
        Provider.of<CheckBoxVisibilityProvider>(context);
    final paymentProvider = Provider.of<PaymentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: customText(
            context: context, text: 'Billing & payments', color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: 'Add a Billing method',
                      letterSpacing: width * 0.0005,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
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
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: AppColor.buttonColor,
                        width: width * 0.005,
                      ),
                    ),
                    elevation: 0,
                  ),
                  child: customText(
                    context: context,
                    text: 'Cancel',
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: checkBoxVisibilityProvider.paymentCardValue,
                        onChanged: (value) {
                          checkBoxVisibilityProvider
                              .togglePaymentCardCheckBox();
                          checkBoxVisibilityProvider.uncheckEsewaCheckBox();
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                            context: context,
                            text: 'Payment card ',
                            color: AppColor.titleTextColor,
                          ),
                          customText(
                            context: context,
                            text:
                                'Visa, Mastercard, AmericanExpress, Discover, Diners',
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: checkBoxVisibilityProvider.paymentCardValue,
                child: AddCardPaymentWidget(),
              ),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: checkBoxVisibilityProvider.esewaValue,
                        onChanged: (value) {
                          checkBoxVisibilityProvider.toggleEsewaCheckBox();
                          checkBoxVisibilityProvider
                              .uncheckPaymentCardCheckBox();
                        },
                      ),
                      customText(
                        context: context,
                        text: 'Esewa ',
                        color: AppColor.titleTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: AppColor.titleTextColor,
                thickness: 0.5,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Visibility(
                visible: checkBoxVisibilityProvider.esewaValue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        context: context,
                        text: 'You will be redirected to Esewa'),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomButton(
                      onPressed: () => paymentProvider
                          .launchEsewaInBrowser(paymentProvider.esewaUrl),
                      text: 'Link Esewa Account',
                    ),
                    const Divider(
                      color: AppColor.titleTextColor,
                      thickness: 0.5,
                    ),
                  ],
                ),
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
