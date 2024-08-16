import 'dart:convert';

import 'package:cosnect/src/model/coser_model.dart';
import 'package:cosnect/src/model/form/survey_model.dart';

class MemoModel {
  final int? id;
  final int? notepadId;
  final String? label;
  final CoserModel? coser;
  final bool? isFavorite;
  final SurveyModel? survey;

  const MemoModel({this.id, this.notepadId, this.label, this.coser, this.isFavorite, this.survey});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'notepadId': notepadId,
      'label': label,
      // coserModel을 json으로 변환
      'coser': jsonEncode(coser?.toMap()),
      'isFavorite': isFavorite == true ? 1 : 0,
      'survey': jsonEncode(survey?.toMap()),
    };
  }

  factory MemoModel.fromMap(Map<String, dynamic> map) {
    return MemoModel(
      id: map['id'],
      notepadId: map['notepadId'],
      label: map['label'],
      coser: map['coser'] != null ? CoserModel.fromMap(jsonDecode(map['coser'])) : null,
      isFavorite: map['isFavorite'] == 1,
      survey: map['survey'] != null ? SurveyModel.fromMap(jsonDecode(map['survey'])) : null,
    );
  }

  // copyWith
  MemoModel copyWith({
    int? id,
    int? notepadId,
    String? label,
    CoserModel? coser,
    bool? isFavorite,
    SurveyModel? survey,
  }) {
    return MemoModel(
      id: id ?? this.id,
      label: label ?? this.label,
      coser: coser ?? this.coser,
      isFavorite: isFavorite ?? this.isFavorite,
      survey: survey ?? this.survey,
    );
  }
}