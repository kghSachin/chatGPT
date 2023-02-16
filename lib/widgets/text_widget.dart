import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.label,
      this.color,
      this.fontWeight,
      this.fontSize});

  final String label;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color,
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight,
      ),
    );
  }
}
