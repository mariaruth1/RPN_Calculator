import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  final Function onButtonTap;
  final bool isPortrait;

  Keypad({super.key, required this.onButtonTap, required this.isPortrait});

  final List<String> landscapeNumbers = [
    '.',
    '1',
    '2',
    '3',
    '4',
    '5',
    '+',
    '-',
    'C',
    '6',
    '7',
    '8',
    '9',
    '0',
    '*',
    '/',
  ];

  final List<String> portraitNumbers = [
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
    '/',
    'Add',
    'Remove',
  ];

  final List<String> addRemove = [
    'Add',
    'Remove',
  ];


  @override
  Widget build(BuildContext context) {
    return isPortrait ? _createPortraitLayout() : _createLandscapeLayout();
  }

  List<Widget> _createButtons(List<String> buttons) {
    return buttons
        .map((button) => ElevatedButton(
              style: _styleButton(button),
              onPressed: () => onButtonTap(button),
              child: AutoSizeText(
                button,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: addRemove.contains(button) ? Colors.indigo[50] : Colors.indigo[800]),
                overflow: TextOverflow.ellipsis,
                minFontSize: 20,
              ),
            ))
        .toList();
  }

  ButtonStyle _styleButton(button) {
    return ElevatedButton.styleFrom(
      backgroundColor: button == 'C'
          ? Colors.red[200]
          : ('+-*/'.contains(button)
              ? Colors.yellow[200]
              : addRemove.contains(button)
                  ? Colors.indigo[500]
                  : Colors.indigo[100]),
      shape: addRemove.contains(button)
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      foregroundColor: addRemove.contains(button)
          ? Colors.indigo[50]
          : Colors.indigo[800],
      elevation: 5,
      shadowColor: addRemove.contains(button)
          ? Colors.black
          : Colors.indigo[400],
    );
  }

  _createPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _createButtonRow(portraitNumbers.sublist(0, 4)),
        _createButtonRow(portraitNumbers.sublist(4, 8)),
        _createButtonRow(portraitNumbers.sublist(8, 12)),
        _createButtonRow(portraitNumbers.sublist(12, 16)),
        _createButtonRow(portraitNumbers.sublist(16, 18)),
      ],
    );
  }

  Flexible _createButtonRow(List<String> buttons) {
    return Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ..._createButtons(buttons),
            ],
          ),
        ),
      );
  }

  _createLandscapeLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _createButtonRow(landscapeNumbers.sublist(0, 8)),
        _createButtonRow(landscapeNumbers.sublist(8, 16)),
        _createButtonRow(addRemove),
      ],
    );
  }
}
