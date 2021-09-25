import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? won;
  final Function onRestart;

  const ResultWidget({
    Key? key,
    this.won,
    required this.onRestart,
  }) : super(key: key);

  _getColor() {
    if (won == null) {
      return Colors.yellow;
    } else if (won!) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (won == null) {
      return Icons.sentiment_satisfied;
    } else if (won!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(1),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => onRestart(),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
