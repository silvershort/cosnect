import 'package:flutter/material.dart';

class RowTitleAndContentText extends StatelessWidget {
  const RowTitleAndContentText({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            content,
          ),
        ),
      ],
    );
  }
}
