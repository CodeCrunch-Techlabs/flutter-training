import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smiley Face',
      home: Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Smiley(),
          )),
    );
  }
}

class Smiley extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SmileyPainter(),
    );
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    // Draw the body
    final paint = Paint()..color = Colors.yellow;
    canvas.drawCircle(center, radius, paint);
    // Draw the mouth
    final smilePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius / 2), 0,
        Math.pi, false, smilePaint);
    // Draw the eyes
    canvas.drawCircle(
        Offset(center.dx - radius / 2, center.dy - radius / 2), 20, Paint());
    canvas.drawCircle(
        Offset(center.dx + radius / 2, center.dy - radius / 2), 20, Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}