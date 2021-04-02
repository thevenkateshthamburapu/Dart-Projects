import 'dart:html';
import '../lib/game_lib.dart';

CanvasElement canvas;

void main() {
  // Get a reference to the canvas.
  CanvasElement canvas = querySelector('#canvas');
  new Board(canvas, new Memory(4));
}

