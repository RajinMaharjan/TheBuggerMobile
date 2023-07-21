import '../constants/exports.dart';

class Themes extends StatelessWidget {
  const Themes({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: const ColorScheme.light()
        //     .copyWith(background: const Color(0xfff1f1f3)),
        // appBarTheme: const AppBarTheme(
        //     titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        //     iconTheme: IconThemeData(color: Colors.black),
        //     centerTitle: true,
        //     elevation: 0),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),
        cardColor: const Color(0xfff1f1f3),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: customPrimarySwatch,
        focusColor: const Color(0xfff1f1f3),
        primaryColor: AppColor.titleTextColor,
      ),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
