import 'package:flutter_test/flutter_test.dart';
import 'package:qa_lint/core/utils/constants/exports.dart';

void main() {
  group('SignupFormFields', () {
    late SignupFormFields signupFormFields;

    setUp(() {
      signupFormFields = SignupFormFields();
    });

    testWidgets('should show all required form fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(signupFormFields);

      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Last Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
      expect(find.text('Sign up'), findsOneWidget);
    });

    testWidgets(
        'should validate form fields when Sign up button is pressed and all fields are valid',
        (WidgetTester tester) async {
      await tester.pumpWidget(signupFormFields);

      // enter valid values in form fields
      await tester.enterText(find.byType(TextFormField).at(0), 'John');
      await tester.enterText(find.byType(TextFormField).at(1), 'Doe');
      await tester.enterText(
          find.byType(TextFormField).at(2), 'test@gmail.com');
      await tester.enterText(find.byType(TextFormField).at(3), 'password123');
      await tester.enterText(find.byType(TextFormField).at(4), 'password123');

      // tap on Sign up button
      await tester.tap(find.text('Sign up'));
      await tester.pumpAndSettle();

      // expect the navigation to LoginPage
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
