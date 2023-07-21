import 'package:qa_lint/features/addtional_information/presentation/widgets.dart';
import 'package:qa_lint/features/addtional_information/presentation/widgets/experience_text_form_field.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({Key? key}) : super(key: key);

  @override
  _PersonalDetailPageState createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  int _currentStep = 0;

  StepState _getStepState(int step) {
    if (_currentStep == step) {
      return StepState.editing;
    } else if (_currentStep > step) {
      return StepState.complete;
    } else {
      return StepState.indexed;
    }
  }

  PersonalDetailController personalDetailController =
      PersonalDetailController();
  DeviceController deviceController = DeviceController();
  ExperienceController experienceController = ExperienceController();
  EducationDetailController educationController = EducationDetailController();
  Validator validator = Validator();

  final GlobalKey<FormState> _personalFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _educationFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _deviceFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _additionalFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  List<Step> getSteps(BuildContext context) => [
        Step(
          state: _getStepState(0),
          isActive: _currentStep >= 0,
          title: const Text('Personal'),
          content: Form(
            key: _personalFormKey,
            child: PersonalTextField(
              validator: validator,
              personalDetailController: personalDetailController,
            ),
          ),
        ),
        Step(
          state: _getStepState(1),
          isActive: _currentStep >= 1,
          title: const Text('Qualification'),
          content: Form(
            key: _educationFormKey,
            child: EducationTextFieldWidget(
              educationDetailController: educationController,
              validator: validator,
            ),
          ),
        ),
        Step(
          state: _getStepState(2),
          isActive: _currentStep >= 2,
          title: const Text('Device'), 
          content: Form(
            key: _deviceFormKey,
            child: DeviceTextFieldWidget(
              validator: validator,
              deviceController: deviceController,
            ),
          ),
        ),
        Step(
          state: _getStepState(3),
          isActive: _currentStep >= 3,
          title: const Text('Experience'),
          content: Form(
            key: _additionalFormKey,
            child: ExperienceTextFormFiledWidget(
              validator: validator,
              experienceController: experienceController,
            ),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    double height = mediaQueryHeight(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Information'),
        centerTitle: true,
      ),
      body: Form(
        key: _globalKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Theme(
              data: ThemeData(primaryColor: Colors.blue),
              child: Expanded(
                child: Stepper(
                  elevation: 1,
                  type: StepperType.vertical,
                  currentStep: _currentStep,
                  steps: getSteps(context),
                  controlsBuilder: (context, details) {
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              if (_currentStep > 0) {
                setState(() {
                  _currentStep--;
                });
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height * 0.012),
              ),
              primary: Colors.grey,
              onPrimary: Colors.white,
            ),
            child: customText(
              context: context,
              text: 'Back',
              color: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_currentStep < getSteps(context).length - 1) {
                  bool isFormValid = false;

                  switch (_currentStep) {
                    case 0:
                      isFormValid = _personalFormKey.currentState!.validate();
                      break;
                    case 1:
                      isFormValid = _educationFormKey.currentState!.validate();
                      break;
                    case 2:
                      isFormValid = _deviceFormKey.currentState!.validate();
                      break;
                    case 3:
                      isFormValid = _additionalFormKey.currentState!.validate();
                      break;
                  }

                  if (isFormValid) {
                    _currentStep++;
                  }
                } else if (_currentStep == getSteps(context).length - 1) {
                  Navigator.pushNamed(context, '/homePage');
                }
              });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(height * 0.012),
              ),
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
            child: customText(
              context: context,
              text: 'Continue',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
