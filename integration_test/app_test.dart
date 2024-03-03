import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rpn_calculator/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> setupWidget(WidgetTester tester) async {
    await tester.pumpWidget(const MyCalculator());
    await tester.pumpAndSettle();
  }

  Future<void> tapButton(WidgetTester tester, String buttonText) async {
    await tester.tap(find.text(buttonText));
    await tester.pumpAndSettle();
  }

  Text getByKey(WidgetTester tester, String key) {
    return find.byKey(Key(key)).evaluate().single.widget as Text;
  }

  // test display updates when number button is tapped
  testWidgets('Update display on number button tap', (WidgetTester tester) async {
    await setupWidget(tester);

    // Verify that the display shows 0
    final enteredText = getByKey(tester, 'Entered Number Display');
    expect(enteredText.data, equals('0'));

    await tapButton(tester, '7');
    final enteredTextAfterTap = getByKey(tester, 'Entered Number Display');

    // Verify that the display shows 7
    expect(enteredTextAfterTap.data, equals('7'));
  });

  //test command is executed when operator button is tapped
  //and that the display updates with the result
  testWidgets('Display updates correctly after calculation is performed', (WidgetTester tester) async {
    await setupWidget(tester);

    // Add 7 and 8 to the stack and execute the addition operation
    await tapButton(tester, '7');
    await tapButton(tester, 'Add');
    await tapButton(tester, '8');
    await tapButton(tester, 'Add');
    await tapButton(tester, '+');

    // Verify that the stack contains the calculation result
    final stackText = getByKey(tester, 'Stack Display');
    expect(stackText.data, equals('15'));

    // Verify that the display shows the correct calculation
    final calculationText = getByKey(tester, 'Calculation Display');
    expect(calculationText.data, equals('7 + 8 = 15'));

    // Verify that enter number field is cleared and shows 0
    final enteredText = getByKey(tester, 'Entered Number Display');
    expect(enteredText.data, equals('0'));
  });

  //test display updates when clear button is tapped
  testWidgets('C clears display completely', (WidgetTester tester) async {
    await setupWidget(tester);

    await tapButton(tester, '7');
    await tapButton(tester, 'Add');
    await tapButton(tester, '8');
    await tapButton(tester, 'Add');
    await tapButton(tester, '+');
    await tapButton(tester, '9');
    await tapButton(tester, 'C');

    // Verify that the stack is cleared
    final stackText = getByKey(tester, 'Stack Display');
    expect(stackText.data, equals(''));

    // Verify that the display clears the calculation
    final calculationText = getByKey(tester, 'Calculation Display');
    expect(calculationText.data, equals(''));

    // Verify that enter number field is cleared and shows 0
    final enteredText = getByKey(tester, 'Entered Number Display');
    expect(enteredText.data, equals('0'));
  });

}