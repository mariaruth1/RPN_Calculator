import 'package:flutter/material.dart';
import 'calc.dart';
import 'keypad.dart';
import 'display.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<num> stack = [];
  String stackString = '';
  String tappedBtn = '0';
  String calculationString = '';
  String? firstNumber;
  String? secondNumber;
  String? result;
  Calculator? calculator;

  @override
  void initState() {
    super.initState();
    calculator = Calculator(stack: stack);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Display(
                enteredNumber: tappedBtn,
                stackString: getStackString(),
                calculationString: calculationString),
          ),
        ),
        Flexible(
          flex: 5,
          child: Keypad(onButtonTap: handleBtnTap),
        ),
      ],
    );
  }

  handleBtnTap(String button) {
    if (button == 'C') {
      setState(() {
        calculator?.clear();
        calculationString = '';
        tappedBtn = '0';
      });
    } else if (button == 'Add') {
      final parsedNumber = double.tryParse(tappedBtn);
      if (parsedNumber != null && parsedNumber != 0) {
        // Check that number is not 0
        setState(() {
          calculator?.push(parsedNumber);
          tappedBtn = '0';
        });
      } else {
        // Handle the case where tappedBtn is not a valid double or is 0
        print("Error: '$tappedBtn' is not a valid number or is 0.");
        setState(() {
          tappedBtn = '0';
        });
      }
    } else if (button == 'Remove') {
      setState(() {
        calculator?.stack
            .removeLast();
      });
    } else if ('0123456789.'.contains(button)) {
      setState(() {
        // Additional checks for decimal points and leading zeros handled here
        if (button == '.' && tappedBtn.contains('.')) {
          // Prevent multiple decimal points
        } else if (tappedBtn == '0' && button != '.') {
          // Replace leading zero with the button value if it's not a decimal
          tappedBtn = button;
        } else if (tappedBtn == '0' && button == '.') {
          // Allow leading zero only for decimals
          tappedBtn += button;
        } else {
          // Append the button value
          tappedBtn += button;
        }
      });
    } else {
      final Command? command = getCommandFromString(button);
      if (command != null && stack.length >= 2) {
        setState(() {
          try {
            firstNumber = stack[stack.length - 2] % 1 == 0
                ? stack[stack.length - 2].toString().replaceAll('.0', '')
                : stack[stack.length - 2].toString();
            secondNumber = stack[stack.length - 1] % 1 == 0
                ? stack[stack.length - 1].toString().replaceAll('.0', '')
                : stack[stack.length - 1].toString();
            calculator?.execute(command);
            result = stack[stack.length - 1] % 1 == 0
                ? stack[stack.length - 1].toString().replaceAll('.0', '')
                : stack[stack.length - 1].toString();
            createCalculationString(firstNumber, secondNumber, result, button);
          } on Exception catch (e) {
            calculationString = "E R R O R";
          }
        });
      }
    }
  }

  Command? getCommandFromString(String commandString) {
    switch (commandString) {
      case '+':
        return AddCommand();
      case '-':
        return SubtractCommand();
      case '*':
        return MultiplyCommand();
      case '/':
        return DivideCommand();
      default:
        return null; // or handle this case appropriately
    }
  }

  // returns stackstring from stack as a string with .0 removed
  // as long as it is not the only number in the stack
  // and has no following numbers
  // and also adds , between numbers
  String getStackString() {
    stackString = '';
    for (var i = 0; i < stack.length; i++) {
      if (stack[i] % 1 == 0) {
        stackString += stack[i].toString().replaceAll('.0', '');
      } else {
        stackString += stack[i].toString();
      }
      if (i < stack.length - 1) {
        stackString += ', ';
      }
    }
    return stackString;
  }

  createCalculationString(firstNumber, secondNumber, result, commandString) {
    calculationString = '$firstNumber $commandString $secondNumber = $result';
  }
}
