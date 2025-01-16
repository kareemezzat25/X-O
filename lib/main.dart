import 'package:flutter/material.dart';
import 'package:xoapp/gameboard.dart';
import 'package:xoapp/xoview.dart';

void main() {
  runApp(const XOGame());
}

class XOGame extends StatelessWidget {
  const XOGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: XOScreen.routeName,
        routes: {
          XOScreen.routeName: (context) => const XOScreen(),
          GameBoard.routeName: (context) => const GameBoard()
        },
        debugShowCheckedModeBanner: false,
        home: const XOScreen());
  }
}
