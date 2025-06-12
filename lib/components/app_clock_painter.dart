import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw clock face
    final clockFacePaint = Paint()
      ..color = const Color(0xFFF8F8F8)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, clockFacePaint);

    // Draw hour markers
    final hourMarkerPaint = Paint()
      ..color = const Color(0xFFCCCCCC)
      ..strokeWidth = 2;

    for (int i = 0; i < 12; i++) {
      final angle = (i * 30) * (3.14159 / 180);
      final x1 = center.dx + (radius - 15) * math.cos(angle);
      final y1 = center.dy + (radius - 15) * math.sin(angle);
      final x2 = center.dx + (radius - 5) * math.cos(angle);
      final y2 = center.dy + (radius - 5) * math.sin(angle);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourMarkerPaint);
    }

    // Draw hour numbers
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final hourNumbers = [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    for (int i = 0; i < 12; i++) {
      final angle = (i * 30 - 90) * (3.14159 / 180);
      final x = center.dx + (radius - 25) * math.cos(angle);
      final y = center.dy + (radius - 25) * math.sin(angle);

      textPainter.text = TextSpan(
        text: hourNumbers[i].toString(),
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF666666),
          fontFamily: 'Poppins',
        ),
      );
      textPainter.layout();

      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }

    // Get current time
    final now = DateTime.now();
    final hour = now.hour % 12;
    final minute = now.minute;

    // Draw hour hand
    final hourAngle = (hour * 30 + minute * 0.5 - 90) * (3.14159 / 180);
    final hourHandPaint = Paint()
      ..color = const Color(0xFF4DD0E1)
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    final hourHandLength = radius * 0.5;
    final hourHandEnd = Offset(
      center.dx + hourHandLength * math.cos(hourAngle),
      center.dy + hourHandLength * math.sin(hourAngle),
    );

    canvas.drawLine(center, hourHandEnd, hourHandPaint);

    // Draw minute hand
    final minuteAngle = (minute * 6 - 90) * (3.14159 / 180);
    final minuteHandPaint = Paint()
      ..color = const Color(0xFF4DD0E1)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final minuteHandLength = radius * 0.7;
    final minuteHandEnd = Offset(
      center.dx + minuteHandLength * math.cos(minuteAngle),
      center.dy + minuteHandLength * math.sin(minuteAngle),
    );

    canvas.drawLine(center, minuteHandEnd, minuteHandPaint);

    // Draw center dot
    final centerDotPaint = Paint()
      ..color = const Color(0xFF4DD0E1)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 6, centerDotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
