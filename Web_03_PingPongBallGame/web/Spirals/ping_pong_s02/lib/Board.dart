library mylib;
import 'dart:html';

class Board{
  CanvasRenderingContext2D context;
  Board(CanvasElement canvas) {
    context = canvas.getContext("2d");
  }

  //draw a circle
  void circle(x, y, r, strokeStyle, fillStyle) {
    final PI=3.14;
    context.beginPath();
    context.strokeStyle = strokeStyle;//outside color
    context.fillStyle = fillStyle;//inside color
    context.arc(x, y, r, 0, PI*2, false);
    context.stroke();
    context.fill();
    context.closePath();
  }

  //draw a rectangle
  void rectangle(x, y, w, h, strokeStyle, fillStyle) {
    context.beginPath();
    context.strokeStyle = strokeStyle;//outside color
    context.fillStyle = fillStyle;//inside color
    context.rect(x,y,w,h);
    context.stroke();
    context.fill();
    context.closePath();
  }
}