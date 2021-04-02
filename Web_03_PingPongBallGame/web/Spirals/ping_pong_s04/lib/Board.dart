library boardlib;
import 'dart:html';
import 'dart:async';
import 'Ball.dart';

class Board{
  CanvasElement canvas;
  CanvasRenderingContext2D context;

  int width;
  int height;

  Board(CanvasElement this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
  }

  void init() {
    Ball ball = new Ball(this, 0, 0, 10);
    //move() called every 10ms.
    new Timer.periodic(const Duration(milliseconds: 10), (t) => ball.move());
  }

  void clear() {
    //removing/clearing shadow of the ball
    context.clearRect(0, 0, width, height);
  }
}