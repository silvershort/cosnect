// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coser_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoserModelImpl _$$CoserModelImplFromJson(Map<String, dynamic> json) =>
    _$CoserModelImpl(
      id: (json['id'] as num).toInt(),
      snsId: json['snsId'] as String?,
      sns: $enumDecodeNullable(_$SNSInfoEnumMap, json['sns']) ?? SNSInfo.x,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CoserModelImplToJson(_$CoserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'snsId': instance.snsId,
      'sns': _$SNSInfoEnumMap[instance.sns]!,
      'email': instance.email,
    };

const _$SNSInfoEnumMap = {
  SNSInfo.x: 'x',
  SNSInfo.instagram: 'instagram',
};
