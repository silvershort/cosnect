import 'dart:convert';
import 'dart:typed_data';

import 'package:cosnect/src/model/coser_model.dart';
import 'package:cosnect/src/model/form/survey_model.dart';
import 'package:cosnect/src/util/uint8_list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_model.freezed.dart';

part 'memo_model.g.dart';

@freezed
class MemoModel with _$MemoModel {
  const factory MemoModel({
    int? id,
    int? notepadId,
    int? coserId,
    String? label,
    @Default(CoserModel()) CoserModel coser,
    bool? isFavorite,
    String? series,
    String? character,
    @Uint8ListConverter() Uint8List? imageBytes,
    SurveyModel? survey,
  }) = _MemoModel;

  factory MemoModel.fromJson(Map<String, dynamic> json) => _$MemoModelFromJson(json);

  factory MemoModel.fromDatabase(Map<String, dynamic> json) {
    return MemoModel(
      id: json['id'],
      notepadId: json['notepadId'],
      coserId: json['coserId'],
      label: json['label'],
      isFavorite: json['isFavorite'] == 1,
      series: json['series'],
      character: json['character'],
      imageBytes: json['imageBytes'],
      survey: json['survey'] != null ? SurveyModel.fromJson(jsonDecode(json['survey'])) : null,
    );
  }
}

/*
class MemoModel {
  final int? id;
  final int? notepadId;
  final String? label;
  final CoserModel? coser;
  final bool? isFavorite;
  final SurveyModel? survey;

  const MemoModel({this.id, this.notepadI
  d, this.label, this.coser, this.isFavorite, this.survey});

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
}*/
