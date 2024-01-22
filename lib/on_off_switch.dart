library on_off_switch;

import 'package:flutter/material.dart';

/// A switch that looks like a toggle switch with a text on or off reflecting the state.
class OnOffSwitch extends StatelessWidget {
  const OnOffSwitch(
      {super.key,
      required this.value,
      required this.onChanged,
      this.width = 80});

  /// The width of the switch.
  final double width;

  /// The current value of the switch (weather on or off) true for on and false for off.
  final bool value;

  /// Called when the user toggles the switch on or off.
  final Function(bool value) onChanged;

  final double _aspectRatio = 24 / 9;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
        begin: value ? 1 : 0,
        end: value ? 1 : 0,
      ),
      curve: Curves.easeInOutBack,
      duration: const Duration(milliseconds: 200),
      builder: (BuildContext context, double animationValue, Widget? child) {
        return GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: _aspectRatio,
              child: SizedBox(
                child: CustomPaint(
                  painter: _SwitchPainter(value: animationValue),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SwitchPainter extends CustomPainter {
  _SwitchPainter({required this.value});

  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final double sectionWidth = width / 3;

    final Color bgColor =
        Color.lerp(Colors.red, Colors.green, value) ?? Colors.red;
    double strokeWidth = (sectionWidth / 6);

    Rect bgRect = Rect.fromLTWH(0, 0, sectionWidth * 2, height);

    double circlePadding = (sectionWidth / 4.8);
    double letterPadding = (sectionWidth / 4);
    final Paint paint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    RRect rRect = RRect.fromRectAndRadius(bgRect, const Radius.circular(50));

    canvas.drawRRect(rRect, paint);

    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    Rect circleRect = Rect.fromLTWH(
        circlePadding + value * sectionWidth,
        circlePadding,
        sectionWidth - 2 * circlePadding,
        height - 2 * circlePadding);
    paint.color = Colors.white;
    rRect = RRect.fromRectAndRadius(circleRect, const Radius.circular(50));
    canvas.drawRRect(rRect, paint);

    paint.color = bgColor;
    paint.strokeCap = StrokeCap.round;

    double lX = 2 * sectionWidth + letterPadding;
    double tY = letterPadding;

    double rX = width - letterPadding - ((1 - value) * (0.14 * sectionWidth));
    double bY = height - letterPadding;

    double mY = tY + (bY - tY) / 2;

    Path path1 = Path();
    path1.moveTo(lX, tY);
    path1.lineTo(lX, bY);
    canvas.drawPath(path1, paint);

    Path path2 = Path();
    path2.moveTo(
        (1 - value) * lX + (value) * lX, (1 - value) * mY + (value) * tY);
    path2.lineTo(rX, (value) * bY + (1 - value) * mY);

    canvas.drawPath(path2, paint);

    Path path3 = Path();
    path3.moveTo((1 - value) * lX + (value) * rX, tY);
    path3.lineTo(rX, (value) * bY + (1 - value) * tY);

    canvas.drawPath(path3, paint);

    lX -= ((1 - value) * sectionWidth);
    rX -= ((1 - value) * sectionWidth);

    paint.color = Color.lerp(Colors.white, Colors.green, value) ?? Colors.white;

    path1 = Path();
    path1.moveTo(lX, tY);
    path1.lineTo(lX, bY);
    canvas.drawPath(path1, paint);

    path2 = Path();
    path2.moveTo(
        (1 - value) * lX + (value) * lX, (1 - value) * mY + (value) * tY);
    path2.lineTo(rX, (value) * bY + (1 - value) * mY);

    canvas.drawPath(path2, paint);

    path3 = Path();
    path3.moveTo((1 - value) * lX + (value) * rX, tY);
    path3.lineTo(rX, (value) * bY + (1 - value) * tY);

    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(_SwitchPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
