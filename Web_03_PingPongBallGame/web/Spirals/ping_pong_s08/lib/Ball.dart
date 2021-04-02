library balllib;
import 'Board.dart';

class Ball {
  Board board;

  num x;
  num y;
  num r;

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
}