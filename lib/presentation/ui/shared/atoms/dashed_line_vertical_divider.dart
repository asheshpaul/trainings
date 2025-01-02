import 'package:flutter/material.dart';

class DashedLineVerticalDivider extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    var max = size.height;
    var dashHeight = 5;
    var dashSpace = 5;
    double startY = 0;
    while (startY < max) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}