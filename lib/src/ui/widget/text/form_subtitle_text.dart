import 'package:flutter/material.dart';

class FormSubtitleText extends StatelessWidget {
  const FormSubtitleText({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Theme.of(context).colorScheme.outline,
      ),
      textAlign: TextAlign.start,
    );
  }
}