import 'package:flutter/material.dart';
import 'package:aflutterapp/board_tile.dart';
import 'package:aflutterapp/tile_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigtorKey = GlobalKey<NavigatorState>();
  var _boardState = List.filled(9, TileState.EMPTY);
  var _currentTurn = TileState.CROSS;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigtorKey,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [Image.asset('images/board.png'), _boardTiles()],
          ),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(
      builder: (context) {
        final boardDimension = MediaQuery.of(context).size.width;
        final tileDimension = boardDimension / 3;

        return Container(
          width: boardDimension,
          height: boardDimension,
          child: Column(
            children: chunk(_boardState, 3).asMap().entries.map((entry) {
              final chunkIndex = entry.key;
              final tileStateChunk = entry.value;
              return Row(
                children: tileStateChunk.asMap().entries.map((innerEntry) {
                  final innerIndex = innerEntry.key;
                  final tileState = innerEntry.value;
                  final tileIndex = (chunkIndex * 3) + innerIndex;
                  return BoardTile(
                    tileState: tileState,
                    dimension: tileDimension,
                    onPressed: () => _updateTileStateForIndex(tileIndex),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _updateTileStateForIndex(int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn = _currentTurn == TileState.CROSS
            ? TileState.CIRCLE
            : TileState.CROSS;
      });
      final winner = _findWinner();
      if (winner != TileState.EMPTY) {
        print('Winner is: $winner');
        _showWinnerDialogue(winner);
      }
    }
  }

  TileState _findWinner() {
    TileState winnerForMatch(int a, int b, int c) {
      if (_boardState[a] != TileState.EMPTY &&
          _boardState[a] == _boardState[b] &&
          _boardState[b] == _boardState[c]) {
        return _boardState[a];
      }
      return TileState.EMPTY;
    }

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    for (var check in checks) {
      if (check != TileState.EMPTY) {
        return check;
      }
    }
    return TileState.EMPTY;
  }

  void _showWinnerDialogue(TileState tileState) {
    final context = navigtorKey.currentState!.overlay!.context;
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Winner'),
            content: Image.asset(
                tileState == TileState.CROSS ? 'images/x.png' : 'images/o.png'),
            actions: [
              TextButton(
                  onPressed: () {
                    _restartGame();
                    Navigator.of(context).pop();
                  },
                  child: const Text('New Game'))
            ],
          );
        });
  }

  void _restartGame() {
    setState(() {
      _boardState = List.filled(9, TileState.EMPTY);
      _currentTurn = TileState.CROSS;
    });
  }
}
