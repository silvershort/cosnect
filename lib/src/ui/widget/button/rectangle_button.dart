import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    required this.text,
    this.onTap,
    this.height = 50,
    this.color,
  });

  final String text;
  final VoidCallback? onTap;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          shape: const BeveledRectangleBorder(),
          backgroundColor: color,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
