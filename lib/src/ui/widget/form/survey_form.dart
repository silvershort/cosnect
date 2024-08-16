import 'package:cosnect/src/model/form/survey_model.dart';
import 'package:cosnect/src/ui/widget/select/survey_radio_widget.dart';
import 'package:cosnect/src/ui/widget/text/form_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveyForm extends HookConsumerWidget {
  const SurveyForm({
    super.key,
    required this.surveyModel,
    this.initialIndex,
    required this.onValidate,
    required this.onSelected,
  });

  final SurveyModel surveyModel;
  final int? initialIndex;
  final Function(bool validate) onValidate;
  final Function(SurveyModel survey) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 10),
          FormTitleText(title: surveyModel.question),
          const SizedBox(height: 20),
          SurveyRadioWidget(
            initialIndex: initialIndex,
            options: surveyModel.options,
            onSelected: (index) {
              onSelected(surveyModel.copyWith(
                selectedIndex: index,
              ));
              onValidate(index >= 0);
            },
          ),
        ],
      ),
    );
  }
}
