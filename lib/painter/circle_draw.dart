import 'package:flutter/material.dart';

class CircleDraw extends CustomPainter {
  CircleDraw({
    required this.color,
    required this.radius,
    this.strokeWidth = 10,
  });

  final double radius;
  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!;
    canvas.drawCircle(Offset(0 + radius, 0 + radius), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CircleDraw oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius;
  }
}
