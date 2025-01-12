import 'package:flutter/material.dart';
import 'package:xoapp/gameboard.dart';
import 'package:xoapp/xoview.dart';

void main() {
  runApp(XOGame());
}

class XOGame extends StatelessWidget {
  const XOGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: XOScreen.routeName,
        routes: {
          XOScreen.routeName: (context) => XOScreen(),
          GameBoard.routeName: (context) => GameBoard()
        },
        debugShowCheckedModeBanner: false,
        home: XOScreen());
  }
}
