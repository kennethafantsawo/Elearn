import 'package:flutter_test/flutter_test.dart';
import 'package:studyforge/main.dart';

void main() {
  testWidgets('StudyForge App Smoke Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const StudyForgeApp());

    // Verify that the app title is present
    expect(find.text('StudyForge'), findsWidgets);

    // You can add more widget tests here
  });
}
