import 'package:flutter/material.dart';

class CircleDraw extends CustomPainter {
  CircleDraw({
    required this.color,
    required this.radius,
  });

  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(Offset(0 + radius, 0 + radius), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CircleDraw oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.radius != radius;
  }
}
