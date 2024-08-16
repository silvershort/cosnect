import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/ui/widget/text/tooltip_text.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<T> showAddNotepadDialog<T>(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return const NotePadDialog();
    },
  );
}

class NotePadDialog extends HookConsumerWidget {
  const NotePadDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();

    return AlertDialog(
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localization.notepad_create_name_msg,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 16,
                ),
          ),
          TooltipText(text: context.localization.notepad_create_tool_tip),
        ],
      ),
      content: TextField(
        autofocus: true,
        controller: nameController,
        onEditingComplete: () {
          context.maybePop(nameController.text);
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                context.maybePop();
              },
              child: Text(
                context.localization.cancel,
              ),
            ),
            TextButton(
              onPressed: () {
                context.maybePop(nameController.text);
              },
              child: Text(
                context.localization.ok,
              ),
            ),
          ],
        )
      ],
    );
  }
}
