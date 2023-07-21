import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/providers/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(QALint());
}

class QALint extends StatelessWidget {
  QALint({
    super.key,
  });
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    if (isTablet) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    return MultiProviderPage(appRouter: appRouter);
  }
}
