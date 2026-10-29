import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:training/main.dart';

void main() {
  testWidgets('welcome screen is the first visible screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to Velia'), findsOneWidget);
    expect(find.textContaining('Stay '), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Create account'), findsOneWidget);
  });

  testWidgets('create account opens each registration step', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Create account'));
    await tester.pumpAndSettle();
    expect(find.text('Let’s get started'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Set up a password'), findsOneWidget);

    await tester.enterText(find.byType(EditableText), 'Strong1!');
    await tester.pump();
    expect(find.text('Great'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.textContaining('What is your date of'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('What is your height?'), findsOneWidget);
    expect(find.text('Ft/in'), findsOneWidget);
    expect(find.text('Cm'), findsOneWidget);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(find.text('Let’s start'), findsOneWidget);
    expect(find.text('Connect your ring'), findsOneWidget);
    expect(find.text('Connect later'), findsOneWidget);

    await tester.tap(find.text('Connect your ring'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Place your ring on'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
