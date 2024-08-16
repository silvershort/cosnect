import 'package:flutter/material.dart';

class AtMarkText extends StatelessWidget {
  const AtMarkText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '@',
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
