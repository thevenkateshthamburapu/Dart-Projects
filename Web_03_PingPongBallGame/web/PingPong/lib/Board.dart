library boardlib;
import 'dart:html';
import 'dart:async';
import 'Ball.dart';
import 'Racket.dart';

class Board{
  static const num x = 0;
  static const num y = 0;
  static const num ballRadius = 8;
  static const num racketWidth = 75;
  static const num racketHeight = 8;

  Timer timer;

  CanvasElement canvas;
  CanvasRenderingContext2D context;

  num width;
  num height;
  double startBallX;
  double startBallY;
  num dx = 2;
  num dy = 4;

  Ball ball;
  Racket racketNorth;
  Racket racketSouth;

  Board(this.canvas) {
    context = canvas.getContext("2d");
    width = canvas.width;
    height = canvas.height;
    border();

    startBallX = width / 2;
    startBallY = height / 2;
    querySelector('#play').onClick.listen((e) {
      init();
    });

  }

  void init() {
    ball = new Ball(this, startBallX, startBallY, ballRadius);
    racketNorth = new Racket(this, width/2, y, racketWidth, racketHeight);
    racketSouth = new Racket(this, width/2, height-racketHeight,
        racketWidth, racketHeight);
    // redraw every 10 ms
    timer = new Timer.periodic(const Duration(milliseconds: 12),
            (t) => redraw());
  }

  void border() {
    context.beginPath();
    context.rect(x, y, width, height);
    context.closePath();
    context.stroke();
  }

  void clear() {
    context.clearRect(x, y, width, height);
    border();
  }

  void redraw() {
    clear();

    ball.draw();

    // Move the north side racket if the left or the right key is pressed.
    if (racketNorth.rightDown) {
      if (racketNorth.x < width - x - racketNorth.w - 4) racketNorth.x += 5;
    } else if (racketNorth.leftDown) {
      if (racketNorth.x > x + 4) racketNorth.x -= 5;
    }
    racketNorth.draw();

    // Move the south side racket if the left or the right key is pressed.
    if (racketSouth.rightDown) {
      if (racketSouth.x < width - x - racketSouth.w - 4) racketSouth.x += 5;
    } else if (racketSouth.leftDown) {
      if (racketSouth.x > x + 4) racketSouth.x -= 5;
    }
    racketSouth.draw();

    // The ball must stay within the west and east sides.
    if (ball.x + dx > width || ball.x + dx < 0) dx = -dx;

    // The north side.
    if (ball.y + dy < 0) {
      if (ball.x > racketNorth.x && ball.x < racketNorth.x + racketNorth.w) {
        dy = -dy;
      } else {
        // The ball hit the north side but outside the racket -
        // game over, so stop the animation.
        timer.cancel();
      }
    }

    // The south side.
    if (ball.y + dy > height) {
      if (ball.x > racketSouth.x && ball.x < racketSouth.x + racketSouth.w) {
        dy = -dy;
      } else {
        // The ball hit the south side but outside the racket -
        // game over, so stop the animation.
        timer.cancel();
      }
    }

    ball.x += dx;
    ball.y += dy;
  }
}