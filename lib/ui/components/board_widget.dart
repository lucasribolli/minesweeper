import 'package:flutter/material.dart';
import 'package:minesweeper/models/block.dart';
import 'package:minesweeper/models/board.dart';
import 'package:minesweeper/ui/components/block_widget.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Block) onOpen;
  final void Function(Block) onSwapMark;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onOpen,
    required this.onSwapMark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: board.columns,
      children: board.blocks.map((Block block) {
        return BlockWidget(
          block: block,
          onOpen: onOpen,
          onSwapMark: onSwapMark,
        );
      }).toList(),
    );
  }
}
