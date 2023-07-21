import 'package:qa_lint/core/utils/constants/progress_indicator_timer_constant.dart';
import 'package:qa_lint/features/profile/presentation/provider/device_provider.dart';
import 'package:qa_lint/features/quiz_page/data/models/quiz_data_source.dart';
import 'package:qa_lint/providers/widgets.dart';

class MultiProviderPage extends StatelessWidget {
  const MultiProviderPage({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordVisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckBoxVisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpUserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginUserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectionStates(),
        ),
        ChangeNotifierProvider(
          create: (context) => DialogProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProjectProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DeviceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EducationDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SettingsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CustomImageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InformationTechnologyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KeySkillProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileBasicDetailProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaymentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgressIndicatorTimerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizApiServices(),
        ),
      ],
      child: Themes(appRouter: appRouter),
    );
  }
}
