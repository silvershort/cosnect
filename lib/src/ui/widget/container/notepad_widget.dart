import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/form/notepad_model.dart';
import 'package:cosnect/src/model/form/template_model.dart';
import 'package:cosnect/src/model/form/template_type.dart';
import 'package:cosnect/src/router/app_router.gr.dart';
import 'package:cosnect/src/ui/widget/button/notepad_button.dart';
import 'package:cosnect/src/ui/widget/container/main_container.dart';
import 'package:cosnect/src/ui/widget/dialog/select_memo_template_dialog.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotepadWidget extends HookConsumerWidget {
  const NotepadWidget({super.key, required this.notepadModel});

  final NotepadModel notepadModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainContainer(
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            notepadModel.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Row(
            children: [
              NotepadButton(
                onTap: () {
                  context.pushRoute(const MemoryRoute());
                },
                iconData: FontAwesomeIcons.bookOpen,
                title: context.localization.memory,
              ),
              const SizedBox(width: 20),
              NotepadButton(
                onTap: () async {
                  final TemplateModel? template = await showMemoTemplateDialog(context);

                  if (template != null) {
                    if (context.mounted) {
                      if (template.type == TemplateType.basic) {
                        context.pushRoute(FormRoute());
                      } else if (template.type == TemplateType.character) {
                        context.pushRoute(FormRoute(character: true));
                      }
                    }
                  }
                },
                iconData: FontAwesomeIcons.pencil,
                title: context.localization.write,
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
