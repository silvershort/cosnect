import 'package:cosnect/src/model/setting/display_mode.dart';
import 'package:cosnect/src/provider/app_setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DisplayModeButton extends ConsumerWidget {
  const DisplayModeButton({
    super.key,
    required this.onChanged,
  });

  final Function(DisplayMode displayMode) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = DisplayMode.values[ref.watch(appSettingProvider.select((value) => value.displayMode))];

    return IconButton(
      icon: Icon(switch (state) {
        DisplayMode.grid => Icons.list,
        DisplayMode.list => Icons.grid_view_rounded,
      }),
      onPressed: () {
        final nextIndex = state.toggleIndex();
        ref.read(appSettingProvider.notifier).setDisplayMode(nextIndex);
        onChanged(state.toggle());
      },
    );
  }
}
