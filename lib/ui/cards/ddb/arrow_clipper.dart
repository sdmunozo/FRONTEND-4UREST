import 'package:flutter/material.dart';

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 20); // Comienza en la esquina inferior izquierda
    path.lineTo(
        size.width / 2, 0); // Va al punto superior medio (punta de la flecha)
    path.lineTo(size.width, 20); // Va a la esquina inferior derecha
    path.close(); // Cierra el path volviendo al punto de inicio
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ArrowShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getClip(rect.size);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    Paint paint = Paint()
      ..color = Colors.red.shade600
      ..style = PaintingStyle.fill;

    canvas.drawPath(getClip(rect.size), paint);
  }

  @override
  ShapeBorder scale(double t) => this;

  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }
}
