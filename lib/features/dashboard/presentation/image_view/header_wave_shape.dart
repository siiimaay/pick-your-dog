import 'package:flutter/material.dart';

class HeaderWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    const minSize = 140.0;

    final pDiff = ((minSize - size.height) * 0.5).truncate().abs();
    path.lineTo(0.0, size.height - pDiff);

    final startPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, minSize);

    path.quadraticBezierTo(
        startPoint.dx, startPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(HeaderWaveClipper oldClipper) => oldClipper != this;
}
