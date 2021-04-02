import 'dart:html';
import 'dart:async';
import 'lib/Board.dart';
import 'lib/Ball.dart';

void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
  //                          left,top,size
  Ball ball = new Ball(board, 0, 0, 10);
  //move() called every 10ms.
  new Timer.periodic(const Duration(milliseconds: 10), (t) => ball.move());
}
