import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/block.dart';
import 'package:minesweeper/models/explosion_exception.dart';

void main() {
  group('Block', () {
    test('Open block without explosion should set isOpened to true', () {
      Block block = Block(line: 0, column: 0);
      block.open();
      expect(block.isOpened, isTrue);
    });

    test('Open block with mine should throws ExplosionException', () {
      Block block = Block(line: 0, column: 0);
      block.putMine();
      expect(block.open, throwsA(isA<ExplosionException>()));
    });


    test('Block with more than 1 int distance should not be neighbor', () {
      Block blockWithoutNeighbors = Block(line: 0, column: 0);
      Block block = Block(line: 1, column: 3);
      blockWithoutNeighbors.addNeighBor(block);
      expect(blockWithoutNeighbors.neighbors.isEmpty, isTrue);
    });

    test('One block with 3 blocks around it should contains 3 neighbors', () {
      Block blockWithNeighbors = Block(line: 3, column: 3);
      Block neighborOne = Block(line: 3, column: 4);
      Block neighborTwo = Block(line: 2, column: 2);
      Block neighborThree = Block(line: 4, column: 4);
      blockWithNeighbors.addNeighBor(neighborOne);
      blockWithNeighbors.addNeighBor(neighborTwo);
      blockWithNeighbors.addNeighBor(neighborThree);

      expect(blockWithNeighbors.neighbors.length, 3);
    });

    test('Two neighbors with mine should result in two mines in neighborhood', () {
      Block blockWithNeighbors = Block(line: 3, column: 3);

      Block neighborOneWithMine = Block(line: 3, column: 4);
      neighborOneWithMine.putMine();

      Block neighborTwoWithMine = Block(line: 2, column: 2);
      neighborTwoWithMine.putMine();

      Block neighborThree = Block(line: 4, column: 4);

      blockWithNeighbors.addNeighBor(neighborOneWithMine);
      blockWithNeighbors.addNeighBor(neighborTwoWithMine);
      blockWithNeighbors.addNeighBor(neighborThree);

      expect(blockWithNeighbors.numberOfMinesInNeighborhood, 2);
    });
  });
}