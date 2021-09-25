import 'package:minesweeper/models/exceptions.dart';

class Block {
  final int line;
  final int column;

  final List<Block> neighbors = [];

  bool _opened = false;
  bool _marked = false;
  bool _withMine = false;
  bool _exploded = false;

  Block({
    required this.line,
    required this.column,
  });

  void addNeighBor(Block neighbor) {
    final lineDelta = (line - neighbor.line).abs();
    final columnDelta = (column - neighbor.column).abs();

    if (columnDelta == 0 && lineDelta == 0) {
      return;
    }

    if (lineDelta <= 1 && columnDelta <= 1) {
      neighbors.add(neighbor);
    }
  }

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (_withMine) {
      _exploded = true;
      throw ExplosionException();
    }

    if (isSafeNeighborhood) {
      for (var neighbor in neighbors) {
        neighbor.open();
      }
    }
  }

  void showMine() {
    if (_withMine) {
      _opened = true;
    }
  }

  void swapMark() {
    _marked = !_marked;
  }

  void restart() {
    _opened = false;
    _marked = false;
    _withMine = false;
    _exploded = false;
  }

  bool get isSolved {
    bool markedAndWithMine = isMarked && isWithMine;
    bool safeAndOpened = !isWithMine && isOpened;

    return markedAndWithMine || safeAndOpened;
  }

  bool get isSafeNeighborhood {
    return neighbors.every((neighbor) => !neighbor.isWithMine);
  }

  int get numberOfMinesInNeighborhood {
    return neighbors.where((neighbor) => neighbor.isWithMine).length;
  }

  void putMine() {
    _withMine = true;
  }

  bool get isWithMine {
    return _withMine;
  }

  bool get isExploded {
    return _exploded;
  }

  bool get isOpened {
    return _opened;
  }

  bool get isMarked {
    return _marked;
  }
}
