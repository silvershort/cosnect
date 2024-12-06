import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/ui/screen/memo_update_screen.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
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

Future<T> showConfirmDialog<T>(
    BuildContext context, {
      String? title,
      required String content,
      required VoidCallback onConfirm,
      bool useRootNavigator = true,
    }) async {
  return await showDialog(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (context) {
      return DefaultDialog(
        title: title,
        content: content,
        useCancel: true,
        positiveButtonText: context.localization.confirm,
        onPositiveTap: onConfirm,
      );
    },
  );
}

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    this.title,
    required this.content,
    this.useCancel = false,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveTap,
  });

  final String? title;
  final String content;
  final bool useCancel;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback? onPositiveTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(content),
      actions: [
        if (useCancel)
          TextButton(
            onPressed: () {
              context.maybePop();
            },
            child: Text(negativeButtonText ?? context.localization.cancel),
          ),
        TextButton(
          onPressed: () {
            onPositiveTap?.call();
            context.maybePop();
          },
          child: Text(positiveButtonText ?? context.localization.ok),
        ),
      ],
    );
  }
}
