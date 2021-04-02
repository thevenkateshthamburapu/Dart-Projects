import 'dart:html';
import 'lib/Board.dart';

void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
  //          left,top,circle-size
  board.circle(75, 75, 10);
  //            left,top,width,height
  board.rectangle(95, 95, 20, 20);
}
