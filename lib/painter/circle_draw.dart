import 'package:flutter/material.dart';

class CircleDraw extends CustomPainter {
  CircleDraw({required this.radius, required this.color});

  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawCircle(Offset(0 + radius, 0 + radius), radius, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
