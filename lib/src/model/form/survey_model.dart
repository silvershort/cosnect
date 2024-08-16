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
}