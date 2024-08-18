import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_model.freezed.dart';

part 'survey_model.g.dart';

@freezed
class SurveyModel with _$SurveyModel {
  const factory SurveyModel({
    String? question,
    @Default([]) List<String> options,
    int? selectedIndex,
  }) = _SurveyModel;

  const SurveyModel._();

  String answer() {
    return options[selectedIndex ?? 0];
  }

  factory SurveyModel.fromJson(Map<String, dynamic> json) => _$SurveyModelFromJson(json);
}

/*
class SurveyModel {
  final String question;
  final List<String> options;
  final int? selectedIndex;

  const SurveyModel({required this.question, required this.options, this.selectedIndex});

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options.join(','),
      'selectedIndex': selectedIndex,
    };
  }

  factory SurveyModel.fromMap(Map<String, dynamic> map) {
    return SurveyModel(
      question: map['question'],
      options: map['options'].split(','),
      selectedIndex: map['selectedIndex'],
    );
  }

  // copyWith
  SurveyModel copyWith({
    String? question,
    List<String>? options,
    int? selectedIndex,
  }) {
    return SurveyModel(
      question: question ?? this.question,
      options: options ?? this.options,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  String toString() {
    return 'SurveyModel{question: $question, options: $options, selectedIndex: $selectedIndex}';
  }
}*/
