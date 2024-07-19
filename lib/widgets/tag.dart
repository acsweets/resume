import 'package:flutter/material.dart';

/// Author:      星星
/// CreateTime:  2024/7/19
/// Contact Me:  1395723441@qq.com
enum TagType {
  bulge, //凸
  sunken, //凹
}

class DrawTag extends CustomPainter {
  final Color color;
  final TagType type;
  final double depth;

  DrawTag({this.color = Colors.blue, this.type = TagType.sunken, this.depth = 0.3})
      : assert(depth >= 0 && depth <= 1, 'Depth must be between 0 and 1');

  @override
  void paint(Canvas canvas, Size size) {
    double tagWidth;
    double tagCoreWidth;
    if (type == TagType.bulge) {
      tagWidth = size.width * (1 - depth);
      tagCoreWidth = size.width;
    } else {
      tagWidth = size.width;
      tagCoreWidth = size.width * (1 - depth);
    }
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(tagWidth, 0)
      ..lineTo(tagCoreWidth, size.height / 2)
      ..lineTo(tagWidth, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }
  //需要在 shouldRepaint 方法中比较当前的 CustomPainter 与旧的 CustomPainter 之间的某些属性，
  // 以确定是否需要重绘。例如，如果标签的颜色或形状没有变化，那么就没有必要重绘标签。
  @override
  bool shouldRepaint(covariant DrawTag oldDelegate) {
    return oldDelegate.color != color;
  }
}
