import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // test display updates when number button is tapped
  testWidgets('Update display on number button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());

    /*final enteredText = find.byKey(const Key('enteredNumber')).evaluate().single.widget as Text;
    expect(enteredText.data, equals('0'));*/

    /*await tester.tap(find.byKey(const Key('7')));
    await tester.pumpAndSettle();

    expect(enteredText.data, equals('7'));*/
  });

  /*
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());

  });
  */

  //test display updates when add button is tapped

  //test command is executed when operator button is tapped
  //and also that the display updates with the result, both in the stackstring and the calculation string

  //test display updates when clear button is tapped



  // Test Button Responsiveness

  // Test Landscape Mode:
  //  Rotate the device to landscape mode and verify that the app layout adjusts appropriately
  //  and remains fully functional.

  // Test Various Screen Sizes:
  //  Run tests on devices with different screen sizes to ensure the UI scales well and remains usable.
}