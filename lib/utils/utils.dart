import 'package:flutter/material.dart';

class Utils {
  static double getYPosition(GlobalKey key) {
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    return offset.dy;
  }

  static double? getHeight(GlobalKey key) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    return box?.size.height;
  }

  static double? getWidth(GlobalKey key) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    return box?.size.width;
  }
}
