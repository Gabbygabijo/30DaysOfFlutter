import 'dart:math';

enum TileState {
  // ignore: constant_identifier_names
  EMPTY, CROSS, CIRCLE
}

List<List<TileState>> chunk(List<TileState> list, int size) {
  return List.generate((list.length / size).ceil(), (index) => list.sublist(index * size, min(index * size + size, list.length)));
}

//list.sublist(index * size, min(index * size + size, list.length))