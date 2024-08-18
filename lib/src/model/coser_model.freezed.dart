// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coser_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoserModel _$CoserModelFromJson(Map<String, dynamic> json) {
  return _CoserModel.fromJson(json);
}

/// @nodoc
mixin _$CoserModel {
  String? get xID => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoserModelCopyWith<CoserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoserModelCopyWith<$Res> {
  factory $CoserModelCopyWith(
          CoserModel value, $Res Function(CoserModel) then) =
      _$CoserModelCopyWithImpl<$Res, CoserModel>;
  @useResult
  $Res call({String? xID, String? email});
}

/// @nodoc
class _$CoserModelCopyWithImpl<$Res, $Val extends CoserModel>
    implements $CoserModelCopyWith<$Res> {
  _$CoserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xID = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      xID: freezed == xID
          ? _value.xID
          : xID // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoserModelImplCopyWith<$Res>
    implements $CoserModelCopyWith<$Res> {
  factory _$$CoserModelImplCopyWith(
          _$CoserModelImpl value, $Res Function(_$CoserModelImpl) then) =
      __$$CoserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? xID, String? email});
}

/// @nodoc
class __$$CoserModelImplCopyWithImpl<$Res>
    extends _$CoserModelCopyWithImpl<$Res, _$CoserModelImpl>
    implements _$$CoserModelImplCopyWith<$Res> {
  __$$CoserModelImplCopyWithImpl(
      _$CoserModelImpl _value, $Res Function(_$CoserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xID = freezed,
    Object? email = freezed,
  }) {
    return _then(_$CoserModelImpl(
      xID: freezed == xID
          ? _value.xID
          : xID // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoserModelImpl extends _CoserModel {
  const _$CoserModelImpl({this.xID, this.email}) : super._();

  factory _$CoserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoserModelImplFromJson(json);

  @override
  final String? xID;
  @override
  final String? email;

  @override
  String toString() {
    return 'CoserModel(xID: $xID, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoserModelImpl &&
            (identical(other.xID, xID) || other.xID == xID) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, xID, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoserModelImplCopyWith<_$CoserModelImpl> get copyWith =>
      __$$CoserModelImplCopyWithImpl<_$CoserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoserModelImplToJson(
      this,
    );
  }
}

abstract class _CoserModel extends CoserModel {
  const factory _CoserModel({final String? xID, final String? email}) =
      _$CoserModelImpl;
  const _CoserModel._() : super._();

  factory _CoserModel.fromJson(Map<String, dynamic> json) =
      _$CoserModelImpl.fromJson;

  @override
  String? get xID;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$CoserModelImplCopyWith<_$CoserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
