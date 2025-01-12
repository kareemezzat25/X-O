import 'package:flutter/material.dart';
import 'package:xoapp/xoview.dart';

void main() {
  runApp(XOGame());
}

class XOGame extends StatelessWidget {
  const XOGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: XOScreen());
  }
}
