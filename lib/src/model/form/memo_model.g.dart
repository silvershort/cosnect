// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemoModelImpl _$$MemoModelImplFromJson(Map<String, dynamic> json) =>
    _$MemoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      notepadId: (json['notepadId'] as num?)?.toInt(),
      coserId: (json['coserId'] as num?)?.toInt(),
      label: json['label'] as String?,
      coser: json['coser'] == null
          ? const CoserModel()
          : CoserModel.fromJson(json['coser'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool?,
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
      'notepadId': instance.notepadId,
      'coserId': instance.coserId,
      'label': instance.label,
      'coser': instance.coser,
      'isFavorite': instance.isFavorite,
      'series': instance.series,
      'character': instance.character,
      'imageBytes': const Uint8ListConverter().toJson(instance.imageBytes),
      'survey': instance.survey,
    };
