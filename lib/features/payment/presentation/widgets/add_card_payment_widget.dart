import 'package:qa_lint/features/payment/presentation/widgets/add_card_payment_custom_text_form_field_widget.dart';

import '../../widgets.dart';

class AddCardPaymentWidget extends StatefulWidget {
  AddCardPaymentWidget({super.key});
  final AddCardPaymentControllers addCardPaymentControllers =
      AddCardPaymentControllers();

  @override
  State<AddCardPaymentWidget> createState() => _AddCardPaymentWidgetState();
}

class _AddCardPaymentWidgetState extends State<AddCardPaymentWidget> {
  @override
  void initState() {
    super.initState();
    _connectivityUtils.initConnectivity(context, _handleConnectivityChanged);
  }

  bool isConnected = true;

  void _handleConnectivityChanged() {
    setState(() {
      isConnected = _connectivityUtils.isConnected;
    });
  } 

  final ConnectivityUtils _connectivityUtils = ConnectivityUtils();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AddCardPaymentControllers addCardPaymentControllers =
      AddCardPaymentControllers();

  @override
  Widget build(BuildContext context) {
    final height = mediaQueryHeight(context);
    final width = mediaQueryWidth(context);
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: AppColor.buttonColor, width: width * 0.005),
          borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              customAddCardPaymentTextFormField(
                context: context,
                controller:
                    addCardPaymentControllers.cardNumberEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a card number';
                  }
                  return null;
                },
                labelText: 'Card Number',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller:
                          addCardPaymentControllers.firstNameEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter first Name';
                        }
                        return null;
                      },
                      labelText: 'First Name',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller:
                          addCardPaymentControllers.lastNameEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Last name';
                        }
                        return null;
                      },
                      labelText: 'Last Name',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller: addCardPaymentControllers
                          .expirationMonthEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter month';
                        }
                        return null;
                      },
                      labelText: 'Expiration Month',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller: addCardPaymentControllers
                          .expirationYearEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter valid year';
                        }
                        return null;
                      },
                      labelText: 'Expiration Year',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller: addCardPaymentControllers
                          .securityCodeEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter CVV number';
                        }
                        return null;
                      },
                      labelText: 'Security Code',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              customText(
                context: context,
                text: 'Billing Address',
                color: AppColor.titleTextColor,
              ),
              SizedBox(height: height * 0.02),
              customAddCardPaymentTextFormField(
                context: context,
                controller: addCardPaymentControllers.countryEditingController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Country';
                  }
                  return null;
                },
                labelText: 'Country',
                onTap: () {
                  showCountryPicker(
                    context: context,
                    countryListTheme: CountryListThemeData(
                      flagSize: 25,
                      backgroundColor: Colors.white,
                      textStyle:
                          const TextStyle(fontSize: 16, color: Colors.blueGrey),
                      bottomSheetHeight: 500, //  Country list modal height
                      //  Sets the border radius for the bottomsheet.
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),

                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                    onSelect: (Country country) {
                      // Update the selected country in the text field
                      addCardPaymentControllers.countryEditingController.text =
                          addCardPaymentControllers.searchEditingController
                              .text = country.displayNameNoCountryCode;
                    },
                  );
                },
              ),
              SizedBox(height: height * 0.02),
              customAddCardPaymentTextFormField(
                context: context,
                controller:
                    addCardPaymentControllers.addressLine1EditingController,
                labelText: 'Address Line 1',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: height * 0.02),
              customAddCardPaymentTextFormField(
                context: context,
                controller:
                    addCardPaymentControllers.addressLine2EditingController,
                labelText: 'Address Line 2',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller:
                          addCardPaymentControllers.cityEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a city';
                        }
                        return null;
                      },
                      labelText: 'City',
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: customAddCardPaymentTextFormField(
                      context: context,
                      controller:
                          addCardPaymentControllers.postalCodeEditingController,
                      labelText: 'Postal Code',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              CustomButton(
                  text: 'Save',
                  onPressed: () {
                    // Handle confirm button press
                    if (_formKey.currentState!.validate()) {
                      // Perform payment processing logic here
                      ConnectivityUtils().handleButtonPressed(context, '/');
                    }
                  }),
              SizedBox(height: height * 0.02),
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
