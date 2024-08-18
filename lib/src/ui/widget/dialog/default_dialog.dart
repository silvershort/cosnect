import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Future<T> showNoticeDialog<T>(
  BuildContext context, {
  String? title,
  required String content,
  bool useRootNavigator = true,
}) async {
  return await showDialog(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      return DefaultDialog(
        title: title,
        content: content,
      );
    },
  );
}

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    this.title,
    required this.content,
  });

  final String? title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            context.maybePop();
          },
          child: const Text('확인'),
        ),
      ],
    );
  }
}
