import 'package:flutter/material.dart';

class TitleUnderWidget extends StatelessWidget {
  const TitleUnderWidget({
    super.key,
    required this.title,
    required this.widget,
    this.titleStyle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String title;
  final Widget widget;
  final TextStyle? titleStyle;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 5),
        widget,
      ],
    );
  }
}
