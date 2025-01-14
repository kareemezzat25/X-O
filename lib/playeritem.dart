import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Image.asset(
            "assets/images/O.png",
          ),
        ),
      ),
    );
  }
}
