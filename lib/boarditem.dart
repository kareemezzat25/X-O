import 'package:flutter/material.dart';

class BoardItem extends StatelessWidget {
  Function onButtonClick;
  int index;
  String player;
  BoardItem(
      {super.key,
      required this.player,
      required this.index,
      required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {
            onButtonClick(index);
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: player.isEmpty
              ? SizedBox()
              : Image.asset(
                  "assets/images/$player.png",
                ),
        ),
      ),
    );
  }
}
