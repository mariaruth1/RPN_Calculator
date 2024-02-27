import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {
  const Keypad({super.key});

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  List<String> buttons = [
    '7',
    '8',
    '9',
    '+',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '*',
    'C',
    '0',
    '=',
    '/'
  ];

  String addNumberBtn = 'Add Number';

  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              children: [
                ..._createButtons(buttons),
              ]),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _createButton(addNumberBtn),
          ),
        ),
      ],
    );
  }

  List<Widget> _createButtons(List<String> buttons) {
    return buttons
        .map((button) => SizedBox(
              child: ElevatedButton(
                style: styleButton(button),
                onPressed: () {},
                child: Text(
                  button,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ))
        .toList();
  }

  Widget _createButton(String button) {
    return ElevatedButton(
      style: styleButton(button),
      onPressed: () {},
      child: Text(
        button,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }

  ButtonStyle styleButton(button) {
    return ElevatedButton.styleFrom(
      backgroundColor: button == 'C'
          ? Colors.red[200]
          : ('+-*/='.contains(button)
              ? Colors.yellow[200]
              : button == 'Add Number'
                  ? Colors.indigo[500]
                  : Colors.indigo[100]),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      foregroundColor:
          button == 'Add Number' ? Colors.indigo[50] : Colors.indigo[800],
      elevation: 5,
      shadowColor: button == 'Add Number' ? Colors.black : Colors.indigo[400],
    );
  }
}
