import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_page/main.dart';

void main() {
  group("Components -> LoginForm Widget", () {
    testWidgets("TextFormFields and ElevatedButton is visible",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Home(),
      ));

      // Create Finders for Email Field, password field and Login button
      final emailAddressField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      final loginButton = find.byType(ElevatedButton).first;

      expect(emailAddressField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(loginButton, findsOneWidget);
    });

    testWidgets("Email Address and password fields are editable",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Home(),
      ));

      // Create Finders for Email Field, password field and Login button
      final emailAddressField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;

      expect(tester.widget<TextFormField>(emailAddressField).enabled, true);
      await tester.enterText(emailAddressField, 'abc@xyz.com');
      expect(find.text('abc@xyz.com'), findsOneWidget);

      expect(tester.widget<TextFormField>(passwordField).enabled, true);
      await tester.enterText(passwordField, '123456');
      expect(find.text('123456'), findsOneWidget);
    });

    testWidgets("Login button is enabled", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Home(),
      ));

      // Create Finders for Email Field, password field and Login button
      final emailAddressField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      final loginButton = find.byType(ElevatedButton).first;
      await tester.enterText(emailAddressField, 'abc@xyz.com');
      await tester.enterText(passwordField, '123456');

      expect(tester.widget<ElevatedButton>(loginButton).enabled, true);
    });

    testWidgets("Email Address and Password validators shows on empty fields",
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Home(),
      ));

      // Create Finders for Email Field, password field and Login button
      final loginButton = find.byType(ElevatedButton).first;

      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      expect(find.text('Required!'), findsNWidgets(2));
    });
  });
}
