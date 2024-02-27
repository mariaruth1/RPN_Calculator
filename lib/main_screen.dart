import 'package:flutter/material.dart';
import 'keypad.dart';
import 'display.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Display()),
        ),
        Flexible(
          flex: 5,
          child: Keypad(),
        ),
      ],
    );
  }
}
