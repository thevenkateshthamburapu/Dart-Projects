library balllib;
import 'Board.dart';

class Ball {
  Board board;

  int x;
  int y;
  int r;
  int dx = 2;
  int dy = 4;
  final PI=3.14;
  Ball(this.board, this.x, this.y, this.r) {
    draw();
  }
//drawing ball
  void draw() {
    board.context.beginPath();
    board.context.arc(x, y, r, 0, PI*2, false);
    board.context.closePath();
    board.context.fill();
  }
//moving ball
  void move() {
    //board.clear();
    board.context.beginPath();
    board.context.arc(x, y, r, 0, PI*2, false);
    board.context.closePath();
    board.context.fill();
    x += dx;
    y += dy;
  }
}