import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/coser_model.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/router/app_router.gr.dart';
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
    final CoserModel? coser = memoModel.coser;

    if (coser == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () {
        context.pushRoute(MemoUpdateRoute(memoModel: memoModel));
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SocialIcon(socialIconType: coser.socialIconType),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          coser.snsID ?? coser.email ?? "",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  if (coser.series != null || coser.character != null)
                    const SizedBox(height: 10),
                  if (coser.series != null)
                    RowTitleAndContentText(
                      title: context.localization.series,
                      content: coser.series!,
                    ),
                  if (coser.character != null)
                    RowTitleAndContentText(
                      title: context.localization.character,
                      content: coser.character!,
                    ),
                ],
              ),
            ),
            if (coser.imageBytes != null)
              ExtendedImage.memory(
                coser.imageBytes!,
                width: 80,
                height: 80,
                compressionRatio: 0.2,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
    );
  }
}
