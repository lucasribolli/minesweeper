import 'dart:math';

import 'package:minesweeper/models/block.dart';
import 'package:minesweeper/models/exceptions.dart';

class Board {
  final int lines;
  final int columns;
  final int numberOfMines;

  final List<Block> _blocks = [];

  Board(
      {required this.lines,
      required this.columns,
      required this.numberOfMines}) {
    if (numberOfMines > lines * columns) {
      throw MinesGreaterThanBoard();
    }
    _createBlocks();
    _createNeighborsRelationships();
    _createMinesRandomly();
  }

  void showMines() {
    for (Block block in _blocks) {
      block.showMine();
    }
  }

  void restart() {
    for (Block block in _blocks) {
      block.restart();
    }
    _createMinesRandomly();
  }

  void _createBlocks() {
    for (int line = 0; line < lines; line++) {
      for (int column = 0; column < columns; column++) {
        _blocks.add(Block(line: line, column: column));
      }
    }
  }

  void _createNeighborsRelationships() {
    for (Block block in _blocks) {
      for (Block neighbor in _blocks) {
        block.addNeighBor(neighbor);
      }
    }
  }

  void _createMinesRandomly() {
    int numberOfRandomMines = 0;

    while (numberOfRandomMines < numberOfMines) {
      int i = Random().nextInt(_blocks.length);

      if (!_blocks[i].isWithMine) {
        numberOfRandomMines++;
        _blocks[i].putMine();
      }
    }
  }

  List<Block> get blocks {
    return _blocks;
  }

  bool get isSolved {
    return _blocks.every((block) => block.isSolved);
  }

  @override
  String toString() =>
      'Board(lines: $lines, columns: $columns, numberOfMines: $numberOfMines)';
}
