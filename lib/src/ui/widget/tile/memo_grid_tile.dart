import 'package:auto_route/auto_route.dart';
import 'package:cosnect/src/model/form/coser_model.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/social_icon_type.dart';
import 'package:cosnect/src/router/app_router.gr.dart';
import 'package:cosnect/src/ui/widget/icon/social_icon.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class MemoGridTile extends StatelessWidget {
  const MemoGridTile({
    super.key,
    required this.memoModel,
  });

  final MemoModel memoModel;

  @override
  Widget build(BuildContext context) {
    final CoserModel coser = memoModel.coser;

    return GestureDetector(
      onTap: () {
        context.pushRoute(MemoUpdateRoute(memoModel: memoModel));
      },
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          memoModel.imageBytes != null
              ? ExtendedImage.memory(
                  memoModel.imageBytes!,
                  fit: BoxFit.cover,
                  compressionRatio: 0.5,
                )
              : Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(16),
                  child: const FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SocialIcon(
                  socialIconType: coser.snsId != null ? SocialIconType.x : SocialIconType.email,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    coser.getCoserAddress(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          offset: const Offset(1, 1),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
