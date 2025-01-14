import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/form/coser_model.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/social_icon_type.dart';
import 'package:cosnect/src/provider/notepad_provider.dart';
import 'package:cosnect/src/router/app_router.gr.dart';
import 'package:cosnect/src/router/route_path.dart';
import 'package:cosnect/src/ui/widget/check_box/sent_check_box.dart';
import 'package:cosnect/src/ui/widget/dialog/default_dialog.dart';
import 'package:cosnect/src/ui/widget/icon/social_icon.dart';
import 'package:cosnect/src/ui/widget/text/row_title_and_content_text.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemoListTile extends HookConsumerWidget {
  const MemoListTile({
    super.key,
    required this.memoModel,
  });

  final MemoModel memoModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CoserModel coser = memoModel.coser;

    return GestureDetector(
      onTap: () {
        context.pushRoute(MemoUpdateRoute(memoModel: memoModel));
      },
      onLongPress: () {
        showConfirmDialog(
          context,
          title: context.localization.delete,
          content:
              context.localization.confirm_msg(context.localization.delete),
          onConfirm: () {
            ref.read(memoListProvider.notifier).deleteMemo(memoModel.id);
          },
        );
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            SentCheckBox(
              initialValue: memoModel.isSent,
              memoId: memoModel.id,
              onChanged: (isSent) {

              },
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SocialIcon(
                          socialIconType: coser.snsId?.isNotEmpty ?? false
                              ? SocialIconType.x
                              : SocialIconType.email),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          coser.getCoserAddress(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  if ((memoModel.series?.isNotEmpty ?? false) ||
                      (memoModel.character?.isNotEmpty ?? false))
                    const SizedBox(height: 10),
                  if (memoModel.series?.isNotEmpty ?? false)
                    RowTitleAndContentText(
                      title: context.localization.series,
                      content: memoModel.series!,
                    ),
                  if (memoModel.character?.isNotEmpty ?? false)
                    RowTitleAndContentText(
                      title: context.localization.character,
                      content: memoModel.character!,
                    ),
                  const SizedBox(height: 10),
                  Text(
                    memoModel.survey?.answer() ?? '',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),
            if (memoModel.imageBytes != null)
              GestureDetector(
                onTap: () {
                  context.pushRoute(PhotoRoute(
                    imageProvider: MemoryImage(memoModel.imageBytes!),
                  ));
                },
                child: ExtendedImage.memory(
                  memoModel.imageBytes!,
                  width: 80,
                  height: 80,
                  compressionRatio: 0.2,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
