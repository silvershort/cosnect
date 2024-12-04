import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/display_mode.dart';
import 'package:cosnect/src/provider/notepad_provider.dart';
import 'package:cosnect/src/ui/widget/tile/memo_grid_tile.dart';
import 'package:cosnect/src/ui/widget/tile/memo_list_tile.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MemoryScreen extends HookConsumerWidget {
  const MemoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 보기 방식
    final displayType = useState(DisplayMode.list);

    final memoList = ref.watch(memoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.memory),
        actions: [
          IconButton(
            icon: Icon(displayType.value == DisplayMode.list ? Icons.list : Icons.grid_view_rounded),
            onPressed: () {
              displayType.value = displayType.value.toggle();
            },
          ),
        ],
      ),
      body: Center(
          child: switch (displayType.value) {
        DisplayMode.grid => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final memoModel = memoList[index];
              return MemoGridTile(
                memoModel: memoModel,
              );
            },
            itemCount: memoList.length,
          ),
        DisplayMode.list => ListView.separated(
            itemBuilder: (context, index) {
              final memoModel = memoList[index];
              return MemoListTile(
                memoModel: memoModel,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: memoList.length,
          ),
      }),
    );
  }
}
