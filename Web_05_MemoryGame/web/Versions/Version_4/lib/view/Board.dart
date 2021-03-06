part of game_lib;
class Board{
  static const String COLOR_CODE = '#f0f0f0';

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num size;
  num boxSize;

  Memory memory;

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    size = canvas.width;
    boxSize = size / memory.length;
    querySelector('#canvas').onMouseDown.listen(onMouseDown);
    window.animationFrame.then(gameLoop);
  }

  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void _clear() {
    context.clearRect(0, 0, size, size);
  }

  void _colorBox(Cell cell) {
    var x = cell.column * boxSize;
    var y = cell.row * boxSize;
    context.beginPath();
    if (cell.hidden) {
      context.fillStyle = COLOR_CODE;
    } else {
      context.fillStyle = colorMap[cell.color];
    }
    context
      ..rect(x, y, boxSize, boxSize)
      ..fill()
      ..stroke()
      ..closePath();
  }

  void _boxes() {
    /* for (Cell cell in memory.cells) {
      print(cell);
      _colorBox(cell);
    }*/
    var it=memory.cells.iterator;
    while(it.moveNext()){
      _colorBox(it.current);
    }
  }

  void draw() {
    _clear();
    _boxes();
  }

  void onMouseDown(MouseEvent e) {
    int row = (e.offset.y ~/ boxSize).toInt();
    int column = (e.offset.x ~/ boxSize).toInt();
    Cell cell = memory.getCell(row, column);
    cell.hidden = false;
    cell.twin.hidden = false;
  }

}