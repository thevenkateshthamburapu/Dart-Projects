library racketlib;
import 'Board.dart';
import 'dart:html';

class Racket {
  Board board;

  num x;
  num y;
  num w;
  num h;

  bool rightDown = false;
  bool leftDown = false;
  var canvasMinX;
  var canvasMaxX;
  Racket(this.board, this.x, this.y, this.w, this.h) {
    canvasMinX = 0;
    canvasMaxX = canvasMinX + board.width;
    draw();
    document.onKeyDown.listen(_onKeyDown);
    document.onKeyUp.listen(_onKeyUp);
    document.onMouseMove.listen(_onMouseMove);
  }
//drawing racket
  void draw() {
    board.context.beginPath();
    board.context.rect(x, y, w, h);
    board.context.closePath();
    board.context.fill();
  }

  //set rightDown or leftDown if the right or left keys are down
  _onKeyDown(event) {
    if (event.keyCode == 39) {
      rightDown = true;
    }
    else if (event.keyCode == 37) {
      leftDown = true;
    }
  }

  //and unset them when the right or left key is released
  _onKeyUp(event) {
    if (event.keyCode == 39) {
      rightDown = false;
    }
    else if (event.keyCode == 37) {
      leftDown = false;
    }
  }
  _onMouseMove(event) {
    if (event.page.x > canvasMinX && event.page.x < canvasMaxX) {
      x = event.page.x - canvasMinX;
      print("Mouse Event");
    }
  }
}