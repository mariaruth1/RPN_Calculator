import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  String enteredNumber;
  String stackString;
  String calculationString;

  Display(
      {super.key,
      required this.enteredNumber,
      required this.stackString,
      required this.calculationString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.indigo[50],
          border: Border.all(
            color: Colors.indigo[300]!,
            width: 2,
          ),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          buildScrollableTextRow(stackString, 30),
          buildScrollableTextRow(calculationString, 20),
          buildScrollableTextRow(enteredNumber, 40),
        ]),
      ),
    );
  }

  Widget buildScrollableTextRow(String text, double fontSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                softWrap: true,
                style:
                    TextStyle(fontSize: fontSize, color: Colors.indigo[900]!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
