import 'dart:html';
import 'lib/Board.dart';

void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  Board board = new Board(canvas);
  //          left,top,circle-size,outside-color,inside-color
  board.circle(105, 105, 100, "green", "000000");
  board.circle(220, 220, 50, "#00a308", "#ff1c0a");
  //            left,top,width,height,outside-color,inside-color
  board.rectangle(15, 150, 120, 120, "rgba(55, 55, 0, .75)", "rgba(155, 155, 0, .5)");
  board.rectangle(150, 250, 220, 100, "rgba(155, 155, 0, .5)", "rgba(355, 355, 0, .75)");
}
