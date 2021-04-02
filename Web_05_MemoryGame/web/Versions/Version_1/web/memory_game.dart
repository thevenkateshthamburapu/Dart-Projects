import 'dart:html';
import '../lib/game_lib.dart';

CanvasElement canvas;

void main() {
  canvas = querySelector('#canvas');
  new Board(canvas);
}

