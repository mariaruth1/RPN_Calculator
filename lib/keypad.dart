import 'package:flutter/material.dart';


class Keypad extends StatelessWidget {
  final Function onButtonTap;

  Keypad({super.key, required this.onButtonTap});

  final List<String> buttons = [
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
    '.',
    '/'
  ];

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
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _createButton("Add Number"),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _createButton("Remove Number"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _createButtons(List<String> buttons) {
    return buttons
        .map((button) => SizedBox(
              child: ElevatedButton(
                style: styleButton(button),
                onPressed: () => onButtonTap(button),
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
      onPressed: () => onButtonTap(button),
      child: Text(
        button,
        style: const TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }

  ButtonStyle styleButton(button) {
    return ElevatedButton.styleFrom(
      backgroundColor: button == 'C'
          ? Colors.red[200]
          : ('+-*/'.contains(button)
              ? Colors.yellow[200]
              : button == 'Add Number' || button == 'Remove Number'
                  ? Colors.indigo[500]
                  : Colors.indigo[100]),
      shape: button == 'Add Number' || button == 'Remove Number'
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      foregroundColor: button == 'Add Number' || button == 'Remove Number'
          ? Colors.indigo[50]
          : Colors.indigo[800],
      elevation: 5,
      shadowColor: button == 'Add Number' || button == 'Remove Number'
          ? Colors.black
          : Colors.indigo[400],
    );
  }
}
