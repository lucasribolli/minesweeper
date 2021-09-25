import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/board.dart';

void main() {
  group('Board', () {
    test('Win game', () {
      Board board = Board(
        lines: 2, 
        columns: 2, 
        numberOfMines: 0
      );

      board.blocks[0].putMine();
      board.blocks[3].putMine();

      board.blocks[0].swapMark();
      board.blocks[1].open();
      board.blocks[2].open();
      board.blocks[3].swapMark();

      expect(board.isSolved, isTrue);
    });
  });
}