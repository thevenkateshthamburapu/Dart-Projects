library balllib;
import 'Board.dart';

class Ball {
  Board board;

  num x;
  num y;
  num r;
  num dx = 2;
  num dy = 4;

  Ball(this.board, this.x, this.y, this.r) {
    draw();
  }
//drawing ball
  void draw() {
    final PI=3.14;
    board.context.beginPath();
    board.context.arc(x, y, r, 0, PI*2, false);
    board.context.closePath();
    board.context.fill();
  }
//moving ball
  void move() {
    board.clear();
    draw();
    //right border            left border
    if (x + dx > board.width || x + dx < 0) {
      dx = -dx;
    }
    //bottom border           top border
    if (y + dy > board.height || y + dy < 0) {
      dy = -dy;
    }
    x += dx;
    y += dy;
  }
}