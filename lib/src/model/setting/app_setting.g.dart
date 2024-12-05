// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingDataImpl _$$AppSettingDataImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingDataImpl(
      lastNotepadId: (json['lastNotepadId'] as num?)?.toInt() ?? 0,
      displayMode: json['displayMode'] ?? 0,
    );

Map<String, dynamic> _$$AppSettingDataImplToJson(
        _$AppSettingDataImpl instance) =>
    <String, dynamic>{
      'lastNotepadId': instance.lastNotepadId,
      'displayMode': instance.displayMode,
    };
