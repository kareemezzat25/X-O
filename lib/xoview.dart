import 'package:flutter/material.dart';

class XOScreen extends StatelessWidget {
  const XOScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/xo.png",
                        width: double.infinity, fit: BoxFit.cover),
                    Text("Tix-Tac-Toe",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white))
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Pick who goes first?",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/images/X.png",
                        height: 86,
                        width: 86,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/images/O.png",
                        width: 86,
                        height: 86,
                      ),
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}
