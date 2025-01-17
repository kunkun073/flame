import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

import '../../commons/square_component.dart';

class ScaleEffectGame extends BaseGame with TapDetector {
  late SquareComponent square;
  bool grow = true;

  @override
  Future<void> onLoad() async {
    square = SquareComponent()
      ..position.setValues(200, 200)
      ..anchor = Anchor.center;
    square.paint = BasicPalette.white.paint()..style = PaintingStyle.stroke;
    final childSquare = SquareComponent()
      ..position = Vector2.all(70)
      ..size = Vector2.all(20)
      ..anchor = Anchor.center;

    square.addChild(childSquare);
    add(square);
  }

  @override
  void onTap() {
    final s = grow ? 3.0 : 1.0;

    grow = !grow;
    square.addEffect(
      ScaleEffect(
        scale: Vector2.all(s),
        speed: 2.0,
        curve: Curves.linear,
      ),
    );
  }
}
