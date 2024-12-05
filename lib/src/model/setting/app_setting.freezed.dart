// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingData _$AppSettingDataFromJson(Map<String, dynamic> json) {
  return _AppSettingData.fromJson(json);
}

/// @nodoc
mixin _$AppSettingData {
  int get lastNotepadId => throw _privateConstructorUsedError;
  dynamic get displayMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingDataCopyWith<AppSettingData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingDataCopyWith<$Res> {
  factory $AppSettingDataCopyWith(
          AppSettingData value, $Res Function(AppSettingData) then) =
      _$AppSettingDataCopyWithImpl<$Res, AppSettingData>;
  @useResult
  $Res call({int lastNotepadId, dynamic displayMode});
}

/// @nodoc
class _$AppSettingDataCopyWithImpl<$Res, $Val extends AppSettingData>
    implements $AppSettingDataCopyWith<$Res> {
  _$AppSettingDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastNotepadId = null,
    Object? displayMode = freezed,
  }) {
    return _then(_value.copyWith(
      lastNotepadId: null == lastNotepadId
          ? _value.lastNotepadId
          : lastNotepadId // ignore: cast_nullable_to_non_nullable
              as int,
      displayMode: freezed == displayMode
          ? _value.displayMode
          : displayMode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingDataImplCopyWith<$Res>
    implements $AppSettingDataCopyWith<$Res> {
  factory _$$AppSettingDataImplCopyWith(_$AppSettingDataImpl value,
          $Res Function(_$AppSettingDataImpl) then) =
      __$$AppSettingDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int lastNotepadId, dynamic displayMode});
}

/// @nodoc
class __$$AppSettingDataImplCopyWithImpl<$Res>
    extends _$AppSettingDataCopyWithImpl<$Res, _$AppSettingDataImpl>
    implements _$$AppSettingDataImplCopyWith<$Res> {
  __$$AppSettingDataImplCopyWithImpl(
      _$AppSettingDataImpl _value, $Res Function(_$AppSettingDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastNotepadId = null,
    Object? displayMode = freezed,
  }) {
    return _then(_$AppSettingDataImpl(
      lastNotepadId: null == lastNotepadId
          ? _value.lastNotepadId
          : lastNotepadId // ignore: cast_nullable_to_non_nullable
              as int,
      displayMode: freezed == displayMode ? _value.displayMode! : displayMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingDataImpl implements _AppSettingData {
  const _$AppSettingDataImpl({this.lastNotepadId = 0, this.displayMode = 0});

  factory _$AppSettingDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingDataImplFromJson(json);

  @override
  @JsonKey()
  final int lastNotepadId;
  @override
  @JsonKey()
  final dynamic displayMode;

  @override
  String toString() {
    return 'AppSettingData(lastNotepadId: $lastNotepadId, displayMode: $displayMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingDataImpl &&
            (identical(other.lastNotepadId, lastNotepadId) ||
                other.lastNotepadId == lastNotepadId) &&
            const DeepCollectionEquality()
                .equals(other.displayMode, displayMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lastNotepadId,
      const DeepCollectionEquality().hash(displayMode));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingDataImplCopyWith<_$AppSettingDataImpl> get copyWith =>
      __$$AppSettingDataImplCopyWithImpl<_$AppSettingDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingDataImplToJson(
      this,
    );
  }
}

abstract class _AppSettingData implements AppSettingData {
  const factory _AppSettingData(
      {final int lastNotepadId,
      final dynamic displayMode}) = _$AppSettingDataImpl;

  factory _AppSettingData.fromJson(Map<String, dynamic> json) =
      _$AppSettingDataImpl.fromJson;

  @override
  int get lastNotepadId;
  @override
  dynamic get displayMode;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingDataImplCopyWith<_$AppSettingDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
