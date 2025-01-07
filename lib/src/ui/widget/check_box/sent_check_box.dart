import 'package:cosnect/src/provider/notepad_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SentCheckBox extends HookConsumerWidget {
  const SentCheckBox({
    super.key,
    required this.initialValue,
    required this.memoId,
    required this.onChanged,
  });

  final bool initialValue;
  final int memoId;
  final Function(bool isSent) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sentState = useState(initialValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Text('전송'),
        Checkbox(
          value: sentState.value,
          onChanged: (value) async {
            bool changedValue = value ?? false;
            sentState.value = changedValue;
            onChanged(changedValue);
            await ref.read(memoListProvider.notifier).updateSent(
                  id: memoId,
                  isSent: changedValue,
                );
          },
        ),
      ],
    );
  }
}
