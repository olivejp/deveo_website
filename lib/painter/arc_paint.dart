import 'package:flutter/material.dart';

class ArcPaint extends CustomPainter {
  ArcPaint({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    Path path = Path();
    path.moveTo(-10, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.65,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.95,
        size.width * 1.0, size.height * 0.7);
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
