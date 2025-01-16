import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xoapp/boarditem.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = "gameBoard";

  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  Timer? _timer;
  int _elapsedSeconds = 0;
  int? playerNumber;
  List<String> Board = ["", "", "", "", "", "", "", "", ""];
  String title = "Player 1’s Turn";
  String formatTime(int elapsedSeconds) {
    final minutes = elapsedSeconds ~/ 60; // Calculate minutes
    final seconds = elapsedSeconds % 60; // Calculate remaining seconds
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}"; // Format as mm:ss
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_elapsedSeconds >= 120) {
        timer.cancel();
      } else {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    playerNumber = ModalRoute.of(context)?.settings.arguments as int;

    return Stack(
      children: [
        Image.asset(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            "assets/images/background.png"),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(44),
                            color: Colors.white),
                        child: Text(formatTime(_elapsedSeconds),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w600))),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(height: 24),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BoardItem(
                            player: Board[0],
                            index: 0,
                            onButtonClick: onButtonClicked,
                          ),
                          BoardItem(
                            player: Board[1],
                            index: 1,
                            onButtonClick: onButtonClicked,
                          ),
                          BoardItem(
                            player: Board[2],
                            index: 2,
                            onButtonClick: onButtonClicked,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BoardItem(
                            player: Board[3],
                            index: 3,
                            onButtonClick: onButtonClicked,
                          ),
                          BoardItem(
                            player: Board[4],
                            index: 4,
                            onButtonClick: onButtonClicked,
                          ),
                          BoardItem(
                            player: Board[5],
                            index: 5,
                            onButtonClick: onButtonClicked,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          BoardItem(
                            player: Board[6],
                            index: 6,
                            onButtonClick: onButtonClicked,
                          ),
                          BoardItem(
                            player: Board[7],
                            index: 7,
                            onButtonClick: onButtonClicked,
                          ),
                          BoardItem(
                            player: Board[8],
                            index: 8,
                            onButtonClick: onButtonClicked,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }

  int counter = 0;
  int counterboard = 0;
  onButtonClicked(index) {
    if (Board[index].isNotEmpty) return;
    bool winner;
    if (counter == 0) {
      title = "Player 1’s Turn";
      Board[index] = playerNumber == 1 ? "X" : "O";
      // check if is win
      winner = checkWinner(Board[index]);
      if (winner) {
        title = "Player 1’s Win";
        resetGame();
        return;
      }
      counter = 1;
      setState(() {});
    } else {
      title = "Player 2’s Turn";
      Board[index] = playerNumber == 0 ? "X" : "O";
      winner = checkWinner(Board[index]);
      if (winner) {
        title = "Player 2’s Win";
        resetGame();
        return;
      }
      counter = 0;

      setState(() {});
    }

    counterboard++;
    if (counterboard == 9) {
      title = "No one win!";
      setState(() {});
      resetGame();
    }
  }

  bool checkWinner(symbol) {
    //check if winner in row
    for (int i = 0; i < 9; i += 3) {
      if (Board[i] == symbol &&
          Board[i + 1] == symbol &&
          Board[i + 2] == symbol) {
        return true;
      }
    }
    //check if winner in column
    for (int i = 0; i < 3; i++) {
      if (Board[i] == symbol &&
          Board[i + 3] == symbol &&
          Board[i + 6] == symbol) {
        return true;
      }
    }
    // check if winner in diagonal

    if (Board[0] == symbol && Board[4] == symbol && Board[8] == symbol)
      return true;
    if (Board[2] == symbol && Board[4] == symbol && Board[6] == symbol)
      return true;

    return false;
  }

  void resetBoard() {
    // start the game again
    Board = ["", "", "", "", "", "", "", "", ""];
    counterboard = 0;
  }

  void resetGame() {
    resetBoard();
    setState(() {
      _elapsedSeconds = 0;
    });
    //stop the time
    _timer?.cancel();
    // start the time again
    startTimer();
  }
}
