import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/form/notepad_model.dart';
import 'package:cosnect/src/provider/notepad_list_provider.dart';
import 'package:cosnect/src/ui/widget/app_bar/main_app_bar.dart';
import 'package:cosnect/src/ui/widget/container/notepad_empty_widget.dart';
import 'package:cosnect/src/ui/widget/container/notepad_widget.dart';
import 'package:cosnect/src/ui/widget/dialog/add_notepad_dialog.dart';
import 'package:cosnect/src/ui/widget/text/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notepadList = ref.watch(notepadListProvider);
    final currentIndex = useState<int>(0);

    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            DashboardTitle(
              onTapAllEvents: () {
              },
            ),
            const SizedBox(height: 40),
            if (notepadList.isNotEmpty) ...[
              NotepadWidget(
                notepadModel: notepadList[currentIndex.value],
              ),
            ] else ...[
              NotepadEmptyWidget(
                onTap: () async {
                  final String? notepadTitle = await showAddNotepadDialog(context);

                  if (notepadTitle != null) {
                    if (context.mounted) {
                     context.loaderOverlay.show();
                    }
                    await ref.read(notepadListProvider.notifier).addNotepad(
                      NotepadModel(title: notepadTitle, memoList: []),
                    );
                    if (context.mounted) {
                      context.loaderOverlay.hide();
                    }
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
