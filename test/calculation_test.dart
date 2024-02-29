import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator/calc.dart';

void main() {
  test('Calculator push method adds a number to the stack', () {
    final calculator = Calculator(stack: []);
    calculator.push(3);
    expect(calculator.stack.last, 3);
  });

  test('Calculator clear method clears the stack', () {
    final calculator = Calculator(stack: [3, 5]);
    calculator.clear();
    expect(calculator.stack.length, 0);
  });

  test('Add command returns correct value', () {
    final calculator = Calculator(stack: [3, 5]);
    calculator.execute(AddCommand());
    expect(calculator.stack.last, 8);
  });

  test('Subtract command returns correct value', () {
    final calculator = Calculator(stack: [3, 5]);
    calculator.execute(SubtractCommand());
    expect(calculator.stack.last, -2);
  });

  test('Multiply command returns correct value', () {
    final calculator = Calculator(stack: [3,5]);
    calculator.execute(MultiplyCommand());
    expect(calculator.stack.last, 15);
  });

  test('Divide command returns correct value', () {
    final calculator = Calculator(stack: [3, 5]);
    calculator.execute(DivideCommand());
    expect(calculator.stack.last, 3 / 5);
  });

test('Divide command throws error when dividing by zero', () {
    final calculator = Calculator(stack: [3, 0]);
    expect(() => calculator.execute(DivideCommand()), throwsException);
  });

  test('Divide command returns value with a maximum of 8 decimals', () {
    final calculator = Calculator(stack: [13, 17]);
    calculator.execute(DivideCommand());
    expect(calculator.stack.last, double.parse((13 / 17).toStringAsFixed(8)));
  });

  test('Calculator executes multiple commands', () {
    final calculator = Calculator(stack: [3, 5, 2]);
    calculator.execute(AddCommand());
    calculator.execute(MultiplyCommand());
    expect(calculator.stack.last, 21);
  });
}