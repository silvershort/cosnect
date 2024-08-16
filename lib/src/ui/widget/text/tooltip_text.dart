import 'package:cosnect/src/provider/shared_preference_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TooltipText extends HookConsumerWidget {
  const TooltipText({
    super.key,
    required this.text,
    this.textStyle,
    this.padding,
  });

  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enable = ref.read(sharedPreferencesProvider).getUseTooltip();

    if (!enable) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
      ),
    );
  }
}
