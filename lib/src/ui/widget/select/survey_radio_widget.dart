import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:collection/collection.dart';

class SurveyRadioWidget extends HookWidget {
  const SurveyRadioWidget({
    Key? key,
    this.initialIndex,
    required this.options,
    required this.onSelected,
  }) : super(key: key);
  final int? initialIndex;
  final List<String> options;
  final Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    final groupValue = useState<int>(initialIndex ?? -1);

    return Column(
      children: options.mapIndexed(
        (index, element) {
          return InkWell(
            child: Container(
              color: groupValue.value == index
                  ? Theme.of(context).colorScheme.secondaryContainer.withAlpha(120)
                  : Theme.of(context).colorScheme.surface,
              child: RadioListTile.adaptive(
                title: Text(
                  element,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                value: index,
                groupValue: groupValue.value,
                onChanged: (value) {
                  groupValue.value = value ?? 0;
                  onSelected(groupValue.value);
                },
                dense: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
