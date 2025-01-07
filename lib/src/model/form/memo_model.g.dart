// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoModelImpl _$$MemoModelImplFromJson(Map<String, dynamic> json) =>
    _$MemoModelImpl(
      id: (json['id'] as num).toInt(),
      coser: CoserModel.fromJson(json['coser'] as Map<String, dynamic>),
      notepad: json['notepad'] == null
          ? null
          : NotepadModel.fromJson(json['notepad'] as Map<String, dynamic>),
      label: json['label'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
      isSent: json['isSent'] as bool? ?? false,
      isReturned: json['isReturned'] as bool? ?? false,
      series: json['series'] as String?,
      character: json['character'] as String?,
      imageBytes:
          const Uint8ListConverter().fromJson(json['imageBytes'] as List<int>?),
      survey: json['survey'] == null
          ? null
          : SurveyModel.fromJson(json['survey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MemoModelImplToJson(_$MemoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coser': instance.coser,
      'notepad': instance.notepad,
      'label': instance.label,
      'isFavorite': instance.isFavorite,
      'isSent': instance.isSent,
      'isReturned': instance.isReturned,
      'series': instance.series,
      'character': instance.character,
      'imageBytes': const Uint8ListConverter().toJson(instance.imageBytes),
      'survey': instance.survey,
    };
