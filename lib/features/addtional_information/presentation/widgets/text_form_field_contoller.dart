import 'package:flutter/material.dart';

class PersonalDetailController {
  TextEditingController firstNameController =
      TextEditingController(text: 'Pradeep');
  TextEditingController lastNameController =
      TextEditingController(text: 'Tharu');
  TextEditingController emailController =
      TextEditingController(text: 'pradeeptharu@gmail.com');
  TextEditingController phoneNumberController =
      TextEditingController(text: '9811673356');
  TextEditingController nationalIdController =
      TextEditingController(text: '123456789');
  TextEditingController addressController =
      TextEditingController(text: 'Kathmandu');
  TextEditingController githubLinkController =
      TextEditingController(text: 'pradeep/github.com');
  TextEditingController linkedinLinkController =
      TextEditingController(text: 'linkedin/pradeep');
  TextEditingController confirmPasswordController = TextEditingController();
}

class EducationDetailController {
  TextEditingController degreeController = TextEditingController(text: 'Hello');
  TextEditingController universityIdController =
      TextEditingController(text: 'Kathmandu University');
  TextEditingController courseController =
      TextEditingController(text: 'Software Engineer');
  TextEditingController specializationController =
      TextEditingController(text: 'Mobile Application');
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
}

class DeviceController {
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController opretingSystemController = TextEditingController();
  TextEditingController deviceTypeController = TextEditingController();
}

class ExperienceController {
  TextEditingController experienceNameController = TextEditingController();
  TextEditingController experienceDescriptionController =
      TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
}
