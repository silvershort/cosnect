import 'dart:typed_data';

import 'package:cosnect/src/model/form/coser_model.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/form/notepad_model.dart';
import 'package:cosnect/src/provider/coser_provider.dart';
import 'package:cosnect/src/ui/widget/button/image_upload_button.dart';
import 'package:cosnect/src/ui/widget/composite/title_under_widget.dart';
import 'package:cosnect/src/ui/widget/divider/text_divider.dart';
import 'package:cosnect/src/ui/widget/dropbox/email_dropbox.dart';
import 'package:cosnect/src/ui/widget/dropbox/sns_dropbox.dart';
import 'package:cosnect/src/ui/widget/icon/social_icon.dart';
import 'package:cosnect/src/ui/widget/text/at_mark_text.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:cosnect/src/util/extension/string_extension.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemoForm extends HookConsumerWidget {
  const MemoForm({
    super.key,
    this.initialMemo,
    this.isUpdate = false,
    required this.onValidate,
    required this.onChanged,
  });

  final MemoModel? initialMemo;
  final bool isUpdate;

  final Function(bool validate) onValidate;
  final Function(MemoModel coserModel) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snsController = useTextEditingController(text: initialMemo?.coser.snsId);
    final emailController = useTextEditingController(text: initialMemo?.coser.email?.removeEmailDomain);
    final seriesController = useTextEditingController(text: initialMemo?.series);
    final characterController = useTextEditingController(text: initialMemo?.character);

    final memoModel = useState<MemoModel>(initialMemo ??
        const MemoModel(
          id: -1,
          coser: CoserModel(id: -1),
        ));
    final emailDomain = useState<String>('gmail.com');
    final imageBytes = useState<Uint8List?>(initialMemo?.imageBytes);

    String getEmailFullAddress() {
      return '${emailController.text}@${emailDomain.value}';
    }

    void snsEditingListener() {
      onValidate(snsController.text.isNotEmpty || emailController.text.isNotEmpty);
      memoModel.value = memoModel.value.copyWith.coser(
        snsId: snsController.text,
      );
      onChanged(memoModel.value);
    }

    void emailEditingListener() {
      onValidate(snsController.text.isNotEmpty || emailController.text.isNotEmpty);
      memoModel.value = memoModel.value.copyWith.coser(
        email: getEmailFullAddress(),
      );
      onChanged(memoModel.value);
    }

    void seriesEditingListener() {
      memoModel.value = memoModel.value.copyWith(
        series: seriesController.text,
      );
      onChanged(memoModel.value);
    }

    void characterEditingListener() {
      memoModel.value = memoModel.value.copyWith(
        character: characterController.text,
      );
      onChanged(memoModel.value);
    }

    useEffect(
      () {
        snsController.addListener(snsEditingListener);
        emailController.addListener(emailEditingListener);
        seriesController.addListener(seriesEditingListener);
        characterController.addListener(characterEditingListener);

        if (snsController.text.isNotEmpty || emailController.text.isNotEmpty) {
          onValidate(true);
        }
        return null;
      },
      [],
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TitleUnderWidget(
            title: context.localization.sns,
            widget: Row(
              children: [
                SNSDropbox(
                  initialSNS: memoModel.value.coser.sns,
                  onSelected: (accountInfo) {
                    memoModel.value = memoModel.value.copyWith.coser(
                      sns: accountInfo,
                    );
                    onChanged(memoModel.value);
                  },
                ),
                // SocialIcon.x(),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: snsController,
                    decoration: const InputDecoration(prefixText: '@'),
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
          ),
          TextDivider(text: context.localization.or, height: 60),
          TitleUnderWidget(
            title: context.localization.email,
            widget: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(width: 5),
                const AtMarkText(),
                EmailDropbox(
                  onChanged: (accountInfo) {
                    emailDomain.value = accountInfo.name;
                    memoModel.value = memoModel.value.copyWith.coser(
                      email: getEmailFullAddress(),
                    );
                    onChanged(memoModel.value);
                  },
                ),
              ],
            ),
          ),
          if (isUpdate) ...[
            const SizedBox(height: 20),
            TitleUnderWidget(
              title: context.localization.series,
              widget: TextFormField(
                controller: seriesController,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 10),
            TitleUnderWidget(
              title: context.localization.character,
              widget: TextFormField(
                controller: characterController,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(height: 10),
            TitleUnderWidget(
              title: context.localization.photo,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (imageBytes.value != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: ExtendedImage.memory(
                        imageBytes.value!,
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ImageUploadButton(
                    onImageSelected: (file) {
                      imageBytes.value = file.readAsBytesSync();
                      memoModel.value = memoModel.value.copyWith(
                        imageBytes: imageBytes.value,
                      );
                      onChanged(
                        memoModel.value,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
