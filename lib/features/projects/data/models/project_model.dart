import '../../widgets.dart';

class ProjectList {
  final int projectId;
  final DateTime createdAt;
  final String createdBy;
  final DateTime lastModifiedAt;
  final String lastModifiedBy;
  final String title;
  final String description;
  final String typeOfJob;
  final int payment;
  final String image;
  // final String deviceRequirements;
  final List<String> deviceRequirements;
  final String domain;
  final Uri link;
  final String areaOfScope;
  final DateTime startDate;
  final DateTime endDate;
  ProjectList({
    required this.projectId,
    required this.createdAt,
    required this.createdBy,
    required this.lastModifiedAt,
    required this.lastModifiedBy,
    required this.title,
    required this.description,
    required this.image,
    required this.typeOfJob,
    required this.payment,
    required this.deviceRequirements,
    required this.domain,
    required this.link,
    required this.areaOfScope,
    required this.startDate,
    required this.endDate,
  });
}

class ProjectListProvider with ChangeNotifier {
  final List<ProjectList> projects = [
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Flutter/ Dart/Firebase - Create a New responsive Website",
        description:
            "We are seeking an experienced Flutter-Dart-Firebase developer to join our team. This position is part of a phased project aimed at creating a new website based on an existing prototype at:\nhttps://6491291af11cb.site123.me/ \nAs a Flutter-Dart-Firebase developer, you will play a crucial role in the development and implementation of the website, ensuring its functionality, performance, and user experience.\nResponsibilities:\n1. Collaborate with the project team to understand the requirements, goals, and technical specifications of the new website.\n2. Develop efficient and high-quality code using Flutter, Dart, and Firebase, adhering to best practices and coding standards.\n3. Customize and enhance the existing prototype, implementing new features and functionalities as required.\n4. Ensure seamless integration of front-end designs and back-end logic, creating a responsive and visually appealing user interface.\n5. Implement Firebase services and APIs for data storage, authentication, and real-time communication.\n6. Conduct thorough testing and debugging of the website to identify and resolve any issues or bugs.\n7. Optimize the website's performance, responsiveness, and loading speed for a smooth user experience.\n8. Collaborate with other developers, designers, and stakeholders to ensure effective communication and alignment throughout the development process.\n9. Stay updated with the latest trends and advancements in Flutter, Dart, and Firebase technologies, incorporating them into the project when applicable.\n10. Provide technical guidance and support to the team, assisting in problem-solving and troubleshooting as needed.\nRequirements:\n1. Solid experience in developing Flutter applications, with a strong command of the Dart programming language.\n2. Proficiency in Firebase services, including Firestore, Authentication, and Cloud Functions.\n3. Proven track record in building responsive and visually appealing user interfaces using Flutter's widget system.\n4. Strong understanding of mobile app development best practices, including performance optimization and memory management.\n5. Experience in integrating third-party libraries and APIs within the Flutter framework.\n6. Knowledge of version control systems, such as Git, for collaborative development.\n7. A portfolio or examples of previous Flutter-Dart-Firebase projects would be advantageous.",
        typeOfJob: "Mobile App development",
        payment: 100,
        deviceRequirements: ["Windows 8 or above ", "Mac M1"],
        domain: "E-commerce",
        link: Uri.parse("https://google.com"),
        areaOfScope: "Payment Module",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.googleLogo),
    ProjectList(
        projectId: 2,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Remote QA Testing Engineer",
        description:
            "Hi!\nWe are looking for a talented and dedicated Remote Testing Engineer to join our team and help us build high-quality websites and web applications.\n\nResponsibilities:\n\nDevelop and execute test plans and test cases for websites and web applications\nPerform manual and automated testing to ensure the functionality, usability, performance, and security of our digital products\nCollaborate with cross-functional teams to identify, report, and troubleshoot defects\nTrack, document, and prioritize issues using bug-tracking software\nContinuously improve testing processes and methodologies\nStay up-to-date with the latest testing tools, trends, and best practices ",
        typeOfJob: "Automation Testing",
        payment: 100,
        deviceRequirements: ["IOS 9 or above"],
        domain: "Technology",
        link: Uri.parse("https://vurilo.com"),
        areaOfScope: "Selenium Automation",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.logoQaLint),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://github.com"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.noInternet),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://apple.com"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.logoQaLint),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://pub.dev"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.noInternet),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://flutter.dev"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.googleLogo),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://flutter.com"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.logoQaLint),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://example.com/project1"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.noInternet),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "This is a sample project description.",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://example.com/project1"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.logoQaLint),
    ProjectList(
        projectId: 1,
        createdAt: DateTime.now(),
        createdBy: "John Doe",
        lastModifiedAt: DateTime.now(),
        lastModifiedBy: "Jane Smith",
        title: "Sample Project",
        description: "T",
        typeOfJob: "Freelance",
        payment: 100,
        deviceRequirements: ["Some device requirements"],
        domain: "Technology",
        link: Uri.parse("https://example.com/project1"),
        areaOfScope: "Web Development",
        startDate: DateTime(2023, 7, 1),
        endDate: DateTime(2023, 7, 31),
        image: ImagePath.noInternet),
  ];
}
