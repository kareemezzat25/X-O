import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  static const String routeName = "gameBoard";
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            "assets/images/background.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
