import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/addtional_information/presentation/pages/personal_detail_page.dart';
import 'package:qa_lint/features/home_page/presentation/pages/homepage.dart';
import 'package:qa_lint/features/payment/presentation/pages/payment_page.dart';
import 'package:qa_lint/features/payment/presentation/pages/add_payment_page.dart';
import 'package:qa_lint/features/projects/presentation/pages/project_page.dart';
import 'package:qa_lint/features/settings/presentation/pages/notification_settings_page.dart';
import 'package:qa_lint/features/settings/presentation/pages/change_password_page.dart';
import 'package:qa_lint/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case '/profilePage':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/personalDetail':
        return MaterialPageRoute(builder: (_) => const PersonalDetailPage());
      case '/homePage':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/signupPage':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/forgotPassword':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case '/quizLandingPage':
        return MaterialPageRoute(builder: (_) => const QuizLandingPage());
      case '/projectDescriptionPage':
        return MaterialPageRoute(
            builder: (_) => const ProjectDescriptionPage());
      case '/projectPage':
        return MaterialPageRoute(builder: (_) => const ProjectPage());
      case '/billingAndPaymentsPage':
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case '/changePasswordPage':
        return MaterialPageRoute(builder: (_) => const ChangePasswordPage());
      case '/notificationSettingsPage':
        return MaterialPageRoute(
          builder: (_) => const NotificationSettingsPage(),
        );
      case '/addPaymentPage':
        return MaterialPageRoute(builder: (_) => const AddPaymentPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
