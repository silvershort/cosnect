import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardTitle extends HookConsumerWidget {
  const DashboardTitle({super.key, required this.title, this.onTapAllEvents});

  final String title;
  final VoidCallback? onTapAllEvents;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                context.localization.event_progress_msg,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onTapAllEvents,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.localization.all_events,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
