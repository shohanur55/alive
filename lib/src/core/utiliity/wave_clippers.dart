import 'package:flutter/material.dart';

/// Custom Clipper for the dark green underlying wave
class DarkBottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.10);

    path.cubicTo(
      size.width * 0.40,
      size.height * -0.10,
      size.width * 0.35,
      size.height * 0.30,
      size.width * 0.85,
      size.height * 0.12,
    );

    path.cubicTo(
      size.width * 0.40,
      size.height * 0.45,
      size.width * 0.60,
      size.height * -0.08,
      size.width,
      size.height * 0.09,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Custom Clipper for the foreground lime-green wave
class MainBottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.20);

    path.cubicTo(
      size.width * 0.30,
      size.height * 0.35,
      size.width * 0.50,
      size.height * 0.01,
      size.width,
      size.height * 0.15,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
