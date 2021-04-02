part of game_lib;

class Cells {
  List<Cell> _list;

  Cells() {
    _list = new List<Cell>();
  }

  void add(Cell cell) {
    _list.add(cell);
  }

  Iterator get iterator => _list.iterator;

  bool every(bool f(Cell cell)) => _list.every(f);

}