import 'package:auto_route/auto_route.dart';
import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/form/survey_model.dart';
import 'package:cosnect/src/provider/notepad_list_provider.dart';
import 'package:cosnect/src/ui/widget/button/step_button.dart';
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
    final memoModel = useState<MemoModel>(MemoModel());

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
                      initialCoser: memoModel.value.coser,
                      onValidate: (validate) {
                        memoValidate.value = validate;
                      },
                      onChanged: (coserModel) {
                        talker.debug('input: $coserModel');
                        memoModel.value = memoModel.value.copyWith(
                          coser: coserModel,
                        );
                      },
                    ),
                  ],
                ),
              ),
              SurveyForm(
                surveyModel: SurveyModel(
                  question: '원하는 사진 보정 스타일을 선택해주세요.',
                  options: [
                    '색감 보정만',
                    '색감 보정 + 피부 보정만',
                    '자연스러운 선에서 자유롭게 보정',
                    '자연스러운 선에서 자유롭게 보정 (원본도 받기)',
                  ],
                ),
                initialIndex: memoModel.value.survey?.selectedIndex,
                onSelected: (survey) {
                  memoModel.value = memoModel.value.copyWith(
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
                  await ref.read(notepadProvider.notifier).addMemo(memoModel.value);
                  if (context.mounted) {
                    context.loaderOverlay.hide();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('작성완료'),
                          content: Text('촬영해주셔서 감사합니다! 메일주소로 받으실 경우 스팸메일함을 꼭 확인해주세요.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.maybePop();
                                context.maybePop();
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
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
