import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/form/survey_model.dart';
import 'package:cosnect/src/provider/coser_provider.dart';
import 'package:cosnect/src/provider/notepad_provider.dart';
import 'package:cosnect/src/ui/widget/button/step_button.dart';
import 'package:cosnect/src/ui/widget/dialog/default_dialog.dart';
import 'package:cosnect/src/ui/widget/form/memo_form.dart';
import 'package:cosnect/src/ui/widget/form/survey_form.dart';
import 'package:cosnect/src/ui/widget/text/form_title_text.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class FormScreen extends HookConsumerWidget {
  const FormScreen({super.key, this.character = false});

  final bool character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoModel = useState<MemoModel?>(null);

    final currentStep = useState<int>(0);
    final pageController = usePageController();

    final memoValidate = useState<bool>(false);
    final surveyValidate = useState<bool>(false);

    final keyboardStream = useMemoized(() => KeyboardVisibilityController().onChange);
    final keyboardSnapshot = useStream(keyboardStream);

    void onChangedStep(int step) {
      FocusManager.instance.primaryFocus?.unfocus();
      // 앞으로 이동
      if (step > currentStep.value) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
      }
      // 뒤로 이동
      else {
        pageController.previousPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
        );
      }
      currentStep.value = step;
    }

    print("@@@ keyboardSnapshot.data : ${keyboardSnapshot.data}");

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FormTitleText(title: context.localization.information_input_msg),
                    ),
                    const SizedBox(height: 30),
                    MemoForm(
                      isUpdate: character,
                      initialMemo: memoModel.value,
                      onValidate: (validate) {
                        memoValidate.value = validate;
                      },
                      onChanged: (newMemoModel) {
                        talker.debug('input: $newMemoModel');
                        memoModel.value = newMemoModel;
                      },
                    ),
                  ],
                ),
              ),
              SurveyForm(
                surveyModel: SurveyModel(
                  question: '원하는 인물 보정 스타일을 선택해주세요.',
                  options: [
                    '인물 보정 필요 없음',
                    '약하게 살짝만 보정',
                    '자연스러운 선에서 자유롭게 보정',
                  ],
                ),
                description: '(보정시 원본도 같이 보내드립니다.)',
                initialIndex: memoModel.value?.survey?.selectedIndex,
                onSelected: (survey) {
                  memoModel.value = memoModel.value?.copyWith(
                    survey: survey,
                  );
                },
                onValidate: (validate) {
                  surveyValidate.value = validate;
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StepButton(
              keyboardFloating: true,
              totalStep: 2,
              onFinished: () async {
                context.loaderOverlay.show();

                try {
                  talker.info('Form write complete');
                  talker.debug('memoModel: ${memoModel.value}');

                  // 코스어 정보를 먼저 저장 후 메모를 저장
                  final coserId = await ref.read(coserProvider.notifier).addOrUpdateCoser(
                        sns: memoModel.value?.coser.sns.name,
                        snsId: memoModel.value?.coser.snsId,
                        email: memoModel.value?.coser.email,
                      );
                  talker.info('coserId : $coserId');
                  final notepadId = ref.read(notepadProvider).currentNote!.id;

                  final memoId = await ref.read(memoListProvider.notifier).addMemo(
                        memo: memoModel.value!,
                        coserId: coserId,
                        notepadId: notepadId,
                      );
                  talker.info('memoId : $memoId');

                  if (context.mounted) {
                    context.loaderOverlay.hide();
                    await showNoticeDialog(
                      context,
                      title: '작성 완료',
                      content: '촬영해주셔서 감사합니다! 메일주소로 받으실 경우 스팸메일함을 꼭 확인해주세요.',
                    );
                    if (context.mounted) {
                      context.maybePop();
                    }
                  }
                } catch (error, _) {
                  if (context.mounted) {
                    context.loaderOverlay.hide();
                  }
                }
              },
              onStep: onChangedStep,
              onValidate: [
                memoValidate.value,
                surveyValidate.value,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
