library boardlib;
import 'dart:html';

class Board{
  CanvasRenderingContext2D context;

  int width;
  int height;

  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
  }

  void clear() {
    context.clearRect(0, 0, width, height);
  }
}