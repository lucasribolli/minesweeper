import 'package:flutter/material.dart';
import 'package:minesweeper/models/block.dart';
import 'package:minesweeper/ui/utils/ui_constants.dart';

class BlockWidget extends StatelessWidget {
  final Block block;
  final void Function(Block) onOpen;
  final void Function(Block) onSwapMark;

  const BlockWidget({
    Key? key,
    required this.block,
    required this.onOpen,
    required this.onSwapMark,
  }) : super(key: key);

  Widget _getImage() {
    int numberOfMines = block.numberOfMinesInNeighborhood;

    if (block.isOpened && block.isExploded) {
      return Image.asset(MinesweeperConstants.mine_0);
    } else if (block.isOpened && block.isWithMine) {
      return Image.asset(MinesweeperConstants.mine_1);
    } else if (block.isOpened) {
      return Image.asset(
          ImageMinesHelper.getAssetsPathFromNumberOfMines(numberOfMines));
    } else if (block.isMarked) {
      return Image.asset(MinesweeperConstants.flag);
    } else {
      return Image.asset(MinesweeperConstants.closed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(block),
      onLongPress: () => onSwapMark(block),
      child: _getImage(),
    );
  }
}
