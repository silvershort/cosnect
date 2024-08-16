import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({
    super.key,
    required this.text,
    this.height = 20,
    this.thickness = 0.2,
    this.color,
  });

  final String text;
  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? Theme.of(context).colorScheme.outline;

    return Row(
      children: [
        Expanded(
          child: Divider(
            height: height,
            thickness: thickness,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(text),
        ),
        Expanded(
          child: Divider(
            height: height,
            thickness: thickness,
            color: color,
          ),
        ),
      ],
    );
  }
}
