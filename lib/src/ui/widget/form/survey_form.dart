import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/form/survey_model.dart';
import 'package:cosnect/src/ui/widget/select/survey_radio_widget.dart';
import 'package:cosnect/src/ui/widget/text/form_subtitle_text.dart';
import 'package:cosnect/src/ui/widget/text/form_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SurveyForm extends HookConsumerWidget {
  const SurveyForm({
    super.key,
    required this.surveyModel,
    this.description,
    this.initialIndex,
    required this.onValidate,
    required this.onSelected,
  });

  final SurveyModel surveyModel;
  final String? description;
  final int? initialIndex;
  final Function(bool validate) onValidate;
  final Function(SurveyModel survey) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FormTitleText(title: surveyModel.question!),
          ),
          if (description != null) ...[
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormSubtitleText(subtitle: description!),
            ),
          ],
          const SizedBox(height: 5),
          const SizedBox(height: 20),
          SurveyRadioWidget(
            initialIndex: initialIndex,
            options: surveyModel.options,
            onSelected: (index) {
              final newSurveyModel = surveyModel.copyWith(selectedIndex: index);
              onSelected(newSurveyModel);
              onValidate(index >= 0);
            },
          ),
        ],
      ),
    );
  }
}
