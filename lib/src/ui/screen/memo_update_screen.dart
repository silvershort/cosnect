import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/coser_model.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/provider/notepad_list_provider.dart';
import 'package:cosnect/src/ui/widget/button/rectangle_button.dart';
import 'package:cosnect/src/ui/widget/form/memo_form.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class MemoUpdateScreen extends HookConsumerWidget {
  const MemoUpdateScreen({super.key, required this.memoModel});

  final MemoModel memoModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoState = useState<MemoModel>(memoModel);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: MemoForm(
            initialMemo: memoModel,
            isUpdate: true,
            onChanged: (memoModel) {
              memoState.value = memoModel;
            },
            onValidate: (validate) {},
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: RectangleButton(
            onTap: () async {
              context.loaderOverlay.show();
              await ref.read(memoListProvider.notifier).updateMemo(
                    memoState.value,
                  );
              if (context.mounted) {
                context.loaderOverlay.hide();
                context.maybePop();
              }
            },
            text: context.localization.ok,
          ),
        ),
      ),
    );
  }
}
