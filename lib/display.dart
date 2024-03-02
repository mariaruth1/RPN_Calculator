import 'package:auto_size_text/auto_size_text.dart';
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
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
          _buildScrollableTextRow("Stack Display", stackString),
          _buildScrollableTextRow("Calculation Display", calculationString),
          _buildScrollableTextRow("Entered Number Display", enteredNumber),
        ]),
      ),
    );
  }

  Widget _buildScrollableTextRow(String keyString, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: AutoSizeText(
              text,
              key: Key(keyString),
              maxLines: 1,
              style: TextStyle(fontSize: 20, color: Colors.indigo[900]!),
              overflow: TextOverflow.ellipsis,
              minFontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

}
