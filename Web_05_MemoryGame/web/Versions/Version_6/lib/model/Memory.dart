part of game_lib;

class Memory{
  int length;
  bool _recalled = false;

  Cells cells;
  List usedColors = [];

  Memory(this.length) {
    if (length.isOdd) {
      throw new Exception(
          'Memory length must be an even integer: $length.');
    }
    cells = new Cells();
    var cell, twinCell;
    for (var x = 0; x < length; x++) {
      for (var y = 0; y < length; y++) {
        cell = getCell(y, x);
        if (cell == null) {
          cell = new Cell(this, y, x);
          cell.color = _getFreeRandomColor();
          cells.add(cell);
          twinCell = _getFreeRandomCell();
          cell.twin = twinCell;
          twinCell.twin = cell;
          twinCell.color = cell.color;
          cells.add(twinCell);
        }
      }
    }
  }

  Cell getCell(int row, int column) {
    /*for (Cell cell in cells) {
      if (cell.intersects(row, column)) {
        return cell;
      }
    }*/
    var it=cells.iterator;
    while(it.moveNext()){
      Cell cell=it.current;
      if (cell.intersects(row, column)) {
        return cell;
      }
    }
    return null;
  }

  Cell _getFreeRandomCell() {
    var row;
    var column;
    Cell cell;
    do {
      row = randomInt(length);
      column = randomInt(length);
      cell = getCell(row, column);
    } while (cell != null);
    return new Cell(this, row, column);
  }

  String _getFreeRandomColor() {
    var color;
    do {
      color = randomColor();
    } while (usedColors.any((c) => c == color));
    usedColors.add(color);
    return color;
  }

  bool get recalled {
    if (!_recalled) {
      if (cells.every((c) => c.shown)) _recalled = true;
    }
    return _recalled;
  }

  hide() {
    /*for (final cell in cells) cell.hidden = true;*/
    var it=cells.iterator;
    while(it.moveNext()){
      Cell cell=it.current;
      cell.hidden = true;
    }
    _recalled = false;
  }

}