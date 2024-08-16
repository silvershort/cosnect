import 'package:flutter/material.dart';

class FormTitleText extends StatelessWidget {
  const FormTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
      textAlign: TextAlign.start,
    );
  }
}