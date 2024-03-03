import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var isPortrait = screenHeight > screenWidth;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
        ),
        home: Scaffold(
          body: SafeArea(
              child: MainScreen()
          ),
        ));
  }
}
