import 'package:cosnect/src/ui/widget/button/rectangle_button.dart';
import 'package:cosnect/src/util/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StepButton extends HookConsumerWidget {
  const StepButton({
    super.key,
    this.height = 50,
    this.keyboardFloating = false,
    this.initialStep = 0,
    required this.totalStep,
    this.finishText,
    required this.onFinished,
    this.onStep,
    required this.onValidate,
  });

  final double height;
  final bool keyboardFloating;
  final int initialStep;
  final int totalStep;
  final String? finishText;
  final VoidCallback onFinished;
  final Function(int index)? onStep;
  final List<bool> onValidate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // onValidate의 길이와 totalStep의 길이가 같아야 한다.
    assert(onValidate.length == totalStep);

    final currentStep = useState<int>(initialStep);

    return Padding(
      padding: keyboardFloating
          ? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)
          : const EdgeInsets.all(0),
      child: Row(
        children: [
          Visibility(
            visible: currentStep.value > 0,
            child: Expanded(
              flex: 1,
              child: RectangleButton(
                height: height,
                onTap: () {
                  if (currentStep.value > 0) {
                    currentStep.value--;
                    onStep?.call(currentStep.value);
                  }
                },
                text: context.localization.back,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: RectangleButton(
              height: height,
              onTap: onValidate[currentStep.value] ? () {
                if (currentStep.value >= totalStep - 1) {
                  onFinished();
                } else {
                  currentStep.value++;
                  onStep?.call(currentStep.value);
                }
              } : null,
              text: (currentStep.value >= totalStep - 1)
                  ? (finishText ?? context.localization.finish)
                  : context.localization.next,
            ),
          ),
        ],
      ),
    );
  }
}
