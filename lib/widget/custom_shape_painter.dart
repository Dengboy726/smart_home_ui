import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  Color lightColor;

  CustomShapePainter(this.lightColor);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          lightColor.withOpacity(0.4),
          Color(0xfff2f2f0).withOpacity(0.5),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final Path path = Path()
      ..moveTo(size.width * 0.12, size.height * 0.2) //top-left
      ..lineTo(size.width * 0.6, size.height * 0.2) //top-right
      ..lineTo(size.width * 1.1, size.height * 1.5) //bottom-right
      ..lineTo(-size.width * 0.3, size.height * 1.5) //bottom-left
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
