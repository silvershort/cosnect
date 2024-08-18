// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notepad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotepadModelImpl _$$NotepadModelImplFromJson(Map<String, dynamic> json) =>
    _$NotepadModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      memoList: (json['memoList'] as List<dynamic>)
          .map((e) => MemoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NotepadModelImplToJson(_$NotepadModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'memoList': instance.memoList,
    };
