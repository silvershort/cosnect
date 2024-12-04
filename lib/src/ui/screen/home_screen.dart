import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/provider/coser_provider.dart';
import 'package:cosnect/src/provider/notepad_provider.dart';
import 'package:cosnect/src/router/app_router.dart';
import 'package:cosnect/src/ui/widget/app_bar/main_app_bar.dart';
import 'package:cosnect/src/ui/widget/container/notepad_empty_widget.dart';
import 'package:cosnect/src/ui/widget/container/notepad_widget.dart';
import 'package:cosnect/src/ui/widget/dialog/add_notepad_dialog.dart';
import 'package:cosnect/src/ui/widget/text/dashboard_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(coserProvider.notifier);
    final notepadState = ref.watch(notepadProvider);
    final currentIndex = useState<int>(0);

    // 뒤로가기 버튼을 누른 시간을 저장
    int backPressedTime = 0;
    const Duration backPressedDuration = Duration(seconds: 2);

    return PopScope(
      canPop: ref.read(appRouterProvider).canPop(),
      onPopInvoked: (didPop) {
        if (backPressedTime + backPressedDuration.inMilliseconds > DateTime.now().millisecondsSinceEpoch) {
          SystemNavigator.pop();
        } else {
          backPressedTime = DateTime.now().millisecondsSinceEpoch;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                Intl.message('back_button_again_msg'),
              ),
              duration: backPressedDuration,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: const MainAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              DashboardTitle(
                title: '2024 Seoul POPCON',
                onTapAllEvents: () async {},
              ),
              const SizedBox(height: 40),
              if (notepadState.noteList.isNotEmpty && notepadState.currentNote != null) ...[
                NotepadWidget(
                  notepadModel: notepadState.currentNote!,
                ),
              ] else ...[
                NotepadEmptyWidget(
                  onTap: () async {
                    final String? notepadTitle = await showAddNotepadDialog(context);

                    if (notepadTitle != null) {
                      if (context.mounted) {
                        context.loaderOverlay.show();
                      }
                      await ref.read(notepadProvider.notifier).addNotepad(
                            title: notepadTitle,
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
      ),
    );
  }
}
