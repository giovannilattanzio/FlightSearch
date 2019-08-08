import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path _path = Path();
    _path.lineTo(0.0, size.height);

    var _firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    var _firstEndPoint = Offset(size.width * 0.5, size.height - 30.0);

    _path.quadraticBezierTo(_firstControlPoint.dx, _firstControlPoint.dy, _firstEndPoint.dx, _firstEndPoint.dy);

    var _secondControlPoint = Offset(size.width * 0.75, size.height - 10.0);
    var _secondEndPoint = Offset(size.width, size.height - 80.0);

    _path.quadraticBezierTo(_secondControlPoint.dx, _secondControlPoint.dy, _secondEndPoint.dx, _secondEndPoint.dy);

    _path.lineTo(size.width, 0.0);
    _path.close();

    return _path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
