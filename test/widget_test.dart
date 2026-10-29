import 'package:flutter_test/flutter_test.dart';
import 'package:training/main.dart';

void main() {
  testWidgets('welcome screen', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome to Velia'), findsOneWidget);
  });
}
