import 'package:flutter/material.dart';
import 'package:minesweeper/components/result_widget.dart';
import 'package:sizer/sizer.dart';

class MinesweeperApp extends StatelessWidget {
  const MinesweeperApp({Key? key}) : super(key: key);

  _restart() {
    debugPrint('restarting...');
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          home: Scaffold(
            appBar: ResultWidget(
              onRestart: _restart,
            ),
            body: Text('Board'),
          ),
        );
      },
    );
  }
}
