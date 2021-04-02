library boardlib;
import 'dart:html';
import 'dart:async';
import 'Ball.dart';
import 'Racket.dart';

class Board{
  static const num START_X = 150;
  static const num START_Y = 150;
  static const num BALL_R = 8;
  static const num RACKET_W = 75;
  static const num RACKET_H = 10;

  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;

  num dx = 2;
  num dy = 4;

  Ball ball;
  Racket racket;

  Board(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
  }

  void init() {
    //                    left,top,size/radius
    ball = new Ball(this, START_X, START_Y, BALL_R);
    //                        left,    top,       width,      height
    racket = new Racket(this, width/2, height-RACKET_H, RACKET_W, RACKET_H);
    // redraw every 10 ms
    timer = new Timer.periodic(const Duration(milliseconds: 10),
            (t) => redraw());
  }

  void clear() {
    context.clearRect(0, 0, width, height);
  }

  void redraw() {
    clear();
    ball.draw();
    //move the racket if the left or the right key is currently pressed
    if (racket.rightDown) { racket.x += 5;
    } else if (racket.leftDown) racket.x -= 5;
    racket.draw();
    //right border            left border
    if (ball.x + dx > width || ball.x + dx < 0) {
      dx = -dx;
    }
    //top border
    if (ball.y + dy < 0) {
      dy = -dy;
    } else if (ball.y + dy > height) {
      //if ball touch racket move
      if (ball.x > racket.x && ball.x < racket.x + racket.w) {
        dy = -dy;
      } else {
        //game over, so stop the animation
        timer.cancel();
      }
    }
    ball.x += dx;
    ball.y += dy;
  }
}