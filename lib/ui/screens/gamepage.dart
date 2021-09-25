import 'package:flutter/material.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/models/block.dart';
import 'package:minesweeper/models/exceptions.dart';
import 'package:minesweeper/ui/components/board_widget.dart';
import 'package:minesweeper/ui/components/result_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
  }

  bool? _won;
  late Board _board;

  void _restart() {
    setState(() {
      _won = null;
      _board.restart();
    });
  }

  void _open(Block block) {
    if (_won != null) {
      return;
    }
    setState(() {
      try {
        block.open();
        if (_board.isSolved) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board.showMines();
      }
    });
  }

  void _swapMark(Block block) {
    if (_won != null) {
      return;
    }
    setState(() {
      block.swapMark();
      if (_board.isSolved) {
        _won = true;
      }
    });
  }

  Board _createBoard({required double width, required double height}) {
    int numberOfColumns = 15;
    double blockSize = width / numberOfColumns;
    int numberOfLines = (height / blockSize).floor();

    _board = Board(
      lines: numberOfLines,
      columns: numberOfColumns,
      numberOfMines: 3,
    );

    return _board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultWidget(
        won: _won,
        onRestart: _restart,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BoardWidget(
            board: _createBoard(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
            ),
            onOpen: _open,
            onSwapMark: _swapMark,
          );
        },
      ),
      // body: BoardWidget(
      //   board: Board(
      //     columns: 2,
      //     lines: 2,
      //     numberOfMines: 1,
      //   ),
      //   onOpen: _open,
      //   onSwapMark: _swapMark,
      // )
    );
  }
}
