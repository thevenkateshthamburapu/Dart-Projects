part of game_lib;
class Board{
  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  Memory memory;

  Board(this.canvas, this.memory) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;
    window.animationFrame.then(gameLoop);
  }

  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void _clear() {
    context.clearRect(0, 0, width, height);
  }

  void _border() {
    context.rect(0, 0, width, height);
    context.stroke();
  }

  void _lines() {
    var gap = height / memory.length;
    var x, y;
    for (var i = 1; i < memory.length; i++) {
      x = gap * i;
      y = x;
      /*
      context.moveTo(x, 0);
      context.lineTo(x, height);
      context.moveTo(0, y);
      context.lineTo(width, y);
      */
      context
      //horizontal position
        ..moveTo(x, 0)  //Starts a new sub-path at the given coordinate.
      //draw a line
        ..lineTo(x, height) //Adds a straight line segment from the current point to the given point.
      //vertical position
        ..moveTo(0, y)
      //draw a line
        ..lineTo(width, y);
    }
  }
  void draw() {
    _clear();
    _border();
    _lines();
  }
}