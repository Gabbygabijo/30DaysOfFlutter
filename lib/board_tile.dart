import 'package:aflutterapp/tile_state.dart';
import 'package:flutter/material.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;

  BoardTile(
      {Key? key,
      required this.tileState,
      required this.dimension,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      child:
          TextButton(onPressed: onPressed, child: _widgetForTileState()),
    );
  }

  Widget _widgetForTileState() {
    Widget widget;

    switch (tileState) {
      case TileState.EMPTY:{
          widget = const Center();
        }
        break;
      case TileState.CROSS:{
        widget = Image.asset('images/x.png');
      }
      break;
      case TileState.CIRCLE: {
        widget =  Image.asset('images/o.png');
      }
      break;
    }

    return widget;
  }
}
