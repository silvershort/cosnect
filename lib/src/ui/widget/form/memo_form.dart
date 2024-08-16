import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/coser_model.dart';
import 'package:cosnect/src/ui/widget/button/image_upload_button.dart';
import 'package:cosnect/src/ui/widget/composite/title_under_widget.dart';
import 'package:cosnect/src/ui/widget/divider/text_divider.dart';
import 'package:cosnect/src/ui/widget/dropbox/email_dropbox.dart';
import 'package:cosnect/src/ui/widget/dropbox/sns_dropbox.dart';
import 'package:cosnect/src/ui/widget/text/at_mark_text.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:extended_image/extended_image.dart';

class MemoForm extends HookConsumerWidget {
  const MemoForm({
    super.key,
    this.initialCoser,
    this.isUpdate = false,
    required this.onValidate,
    required this.onChanged,
  });

  final CoserModel? initialCoser;
  final bool isUpdate;

  final Function(bool validate) onValidate;
  final Function(CoserModel coserModel) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snsController = useTextEditingController(text: initialCoser?.snsID);
    final emailController = useTextEditingController(text: initialCoser?.email);
    final seriesController = useTextEditingController(text: initialCoser?.series);
    final characterController = useTextEditingController(text: initialCoser?.character);

    final coserModel = useState(initialCoser ?? const CoserModel());
    final emailDomain = useState('gmail.com');
    final imageBytes = useState(initialCoser?.imageBytes);

    String getEmailFullAddress() {
      return '${emailController.text}@${emailDomain.value}';
    }

    void snsEditingListener() {
      onValidate(snsController.text.isNotEmpty || emailController.text.isNotEmpty);
      coserModel.value = coserModel.value.copyWith(
        snsID: snsController.text,
      );
      onChanged(coserModel.value);
    }

    void emailEditingListener() {
      onValidate(snsController.text.isNotEmpty || emailController.text.isNotEmpty);
      coserModel.value = coserModel.value.copyWith(
        email: getEmailFullAddress(),
      );
      onChanged(coserModel.value);
    }

    void seriesEditingListener() {
      coserModel.value = coserModel.value.copyWith(
        series: seriesController.text,
      );
      onChanged(coserModel.value);
    }

    void characterEditingListener() {
      coserModel.value = coserModel.value.copyWith(
        character: characterController.text,
      );
      onChanged(coserModel.value);
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
                  initialSNS: coserModel.value.snsInfo,
                  onSelected: (accountInfo) {
                    coserModel.value = coserModel.value.copyWith(
                      snsInfo: accountInfo,
                    );
                    onChanged(coserModel.value);
                  },
                ),
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
                    coserModel.value = coserModel.value.copyWith(
                      email: getEmailFullAddress(),
                    );
                    onChanged(coserModel.value);
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
                      coserModel.value = coserModel.value.copyWith(
                        imageBytes: imageBytes.value,
                      );
                      onChanged(
                        coserModel.value,
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
