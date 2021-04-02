library mylib;
import 'dart:html';

class Board{
  CanvasRenderingContext2D context;
  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
  }

  //draw a circle
  void circle(x, y, r) {
    final PI=3.14;
    context.beginPath();
    context.arc(x, y, r, 0, PI*2, false);
    context.closePath();
    context.fill();
    //context.stroke();
  }

  //draw a rectangle
  void rectangle(x, y, w, h) {
    context.beginPath();
    context.rect(x,y,w,h);
    context.closePath();
    context.stroke();
    //context.fill();
  }
}