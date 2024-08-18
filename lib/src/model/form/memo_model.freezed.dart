// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemoModel _$MemoModelFromJson(Map<String, dynamic> json) {
  return _MemoModel.fromJson(json);
}

/// @nodoc
mixin _$MemoModel {
  int? get id => throw _privateConstructorUsedError;
  int? get notepadId => throw _privateConstructorUsedError;
  int? get coserId => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  CoserModel get coser => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  String? get series => throw _privateConstructorUsedError;
  String? get character => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get imageBytes => throw _privateConstructorUsedError;
  SurveyModel? get survey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoModelCopyWith<MemoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoModelCopyWith<$Res> {
  factory $MemoModelCopyWith(MemoModel value, $Res Function(MemoModel) then) =
      _$MemoModelCopyWithImpl<$Res, MemoModel>;
  @useResult
  $Res call(
      {int? id,
      int? notepadId,
      int? coserId,
      String? label,
      CoserModel coser,
      bool? isFavorite,
      String? series,
      String? character,
      @Uint8ListConverter() Uint8List? imageBytes,
      SurveyModel? survey});

  $CoserModelCopyWith<$Res> get coser;
  $SurveyModelCopyWith<$Res>? get survey;
}

/// @nodoc
class _$MemoModelCopyWithImpl<$Res, $Val extends MemoModel>
    implements $MemoModelCopyWith<$Res> {
  _$MemoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? notepadId = freezed,
    Object? coserId = freezed,
    Object? label = freezed,
    Object? coser = null,
    Object? isFavorite = freezed,
    Object? series = freezed,
    Object? character = freezed,
    Object? imageBytes = freezed,
    Object? survey = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      notepadId: freezed == notepadId
          ? _value.notepadId
          : notepadId // ignore: cast_nullable_to_non_nullable
              as int?,
      coserId: freezed == coserId
          ? _value.coserId
          : coserId // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      coser: null == coser
          ? _value.coser
          : coser // ignore: cast_nullable_to_non_nullable
              as CoserModel,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as String?,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      survey: freezed == survey
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as SurveyModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CoserModelCopyWith<$Res> get coser {
    return $CoserModelCopyWith<$Res>(_value.coser, (value) {
      return _then(_value.copyWith(coser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SurveyModelCopyWith<$Res>? get survey {
    if (_value.survey == null) {
      return null;
    }

    return $SurveyModelCopyWith<$Res>(_value.survey!, (value) {
      return _then(_value.copyWith(survey: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemoModelImplCopyWith<$Res>
    implements $MemoModelCopyWith<$Res> {
  factory _$$MemoModelImplCopyWith(
          _$MemoModelImpl value, $Res Function(_$MemoModelImpl) then) =
      __$$MemoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? notepadId,
      int? coserId,
      String? label,
      CoserModel coser,
      bool? isFavorite,
      String? series,
      String? character,
      @Uint8ListConverter() Uint8List? imageBytes,
      SurveyModel? survey});

  @override
  $CoserModelCopyWith<$Res> get coser;
  @override
  $SurveyModelCopyWith<$Res>? get survey;
}

/// @nodoc
class __$$MemoModelImplCopyWithImpl<$Res>
    extends _$MemoModelCopyWithImpl<$Res, _$MemoModelImpl>
    implements _$$MemoModelImplCopyWith<$Res> {
  __$$MemoModelImplCopyWithImpl(
      _$MemoModelImpl _value, $Res Function(_$MemoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? notepadId = freezed,
    Object? coserId = freezed,
    Object? label = freezed,
    Object? coser = null,
    Object? isFavorite = freezed,
    Object? series = freezed,
    Object? character = freezed,
    Object? imageBytes = freezed,
    Object? survey = freezed,
  }) {
    return _then(_$MemoModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      notepadId: freezed == notepadId
          ? _value.notepadId
          : notepadId // ignore: cast_nullable_to_non_nullable
              as int?,
      coserId: freezed == coserId
          ? _value.coserId
          : coserId // ignore: cast_nullable_to_non_nullable
              as int?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      coser: null == coser
          ? _value.coser
          : coser // ignore: cast_nullable_to_non_nullable
              as CoserModel,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      series: freezed == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as String?,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      survey: freezed == survey
          ? _value.survey
          : survey // ignore: cast_nullable_to_non_nullable
              as SurveyModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemoModelImpl implements _MemoModel {
  const _$MemoModelImpl(
      {this.id,
      this.notepadId,
      this.coserId,
      this.label,
      this.coser = const CoserModel(),
      this.isFavorite,
      this.series,
      this.character,
      @Uint8ListConverter() this.imageBytes,
      this.survey});

  factory _$MemoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemoModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? notepadId;
  @override
  final int? coserId;
  @override
  final String? label;
  @override
  @JsonKey()
  final CoserModel coser;
  @override
  final bool? isFavorite;
  @override
  final String? series;
  @override
  final String? character;
  @override
  @Uint8ListConverter()
  final Uint8List? imageBytes;
  @override
  final SurveyModel? survey;

  @override
  String toString() {
    return 'MemoModel(id: $id, notepadId: $notepadId, coserId: $coserId, label: $label, coser: $coser, isFavorite: $isFavorite, series: $series, character: $character, imageBytes: $imageBytes, survey: $survey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.notepadId, notepadId) ||
                other.notepadId == notepadId) &&
            (identical(other.coserId, coserId) || other.coserId == coserId) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.coser, coser) || other.coser == coser) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.character, character) ||
                other.character == character) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            (identical(other.survey, survey) || other.survey == survey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      notepadId,
      coserId,
      label,
      coser,
      isFavorite,
      series,
      character,
      const DeepCollectionEquality().hash(imageBytes),
      survey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemoModelImplCopyWith<_$MemoModelImpl> get copyWith =>
      __$$MemoModelImplCopyWithImpl<_$MemoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemoModelImplToJson(
      this,
    );
  }
}

abstract class _MemoModel implements MemoModel {
  const factory _MemoModel(
      {final int? id,
      final int? notepadId,
      final int? coserId,
      final String? label,
      final CoserModel coser,
      final bool? isFavorite,
      final String? series,
      final String? character,
      @Uint8ListConverter() final Uint8List? imageBytes,
      final SurveyModel? survey}) = _$MemoModelImpl;

  factory _MemoModel.fromJson(Map<String, dynamic> json) =
      _$MemoModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get notepadId;
  @override
  int? get coserId;
  @override
  String? get label;
  @override
  CoserModel get coser;
  @override
  bool? get isFavorite;
  @override
  String? get series;
  @override
  String? get character;
  @override
  @Uint8ListConverter()
  Uint8List? get imageBytes;
  @override
  SurveyModel? get survey;
  @override
  @JsonKey(ignore: true)
  _$$MemoModelImplCopyWith<_$MemoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
