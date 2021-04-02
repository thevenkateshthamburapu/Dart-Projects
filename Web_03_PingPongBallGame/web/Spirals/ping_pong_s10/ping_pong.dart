import 'dart:html';
import 'lib/Board.dart';

void main() {
  //get a reference to the canvas
  CanvasElement canvas = document.querySelector('#canvas');
  new Board(canvas);
}
