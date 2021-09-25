class MinesweeperConstants {
  static const String mine_0 = 'assets/images/mine_0.jpeg';
  static const String mine_1 = 'assets/images/mine_1.jpeg';
  static const String flag = 'assets/images/flag.jpeg';
  static const String closed = 'assets/images/closed.jpeg';
}

class ImageMinesHelper {
  static getAssetsPathFromNumberOfMines(int numberOfMines) {
    return 'assets/images/opened_$numberOfMines.jpeg';
  }
}
