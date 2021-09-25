import 'package:flutter/material.dart';
import 'package:minesweeper/ui/screens/gamepage.dart';

class MinesweeperApp extends StatelessWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GamePage(),
    );
  }
}
