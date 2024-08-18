// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notepad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotepadModel _$NotepadModelFromJson(Map<String, dynamic> json) {
  return _NotepadModel.fromJson(json);
}

/// @nodoc
mixin _$NotepadModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<MemoModel> get memoList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotepadModelCopyWith<NotepadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotepadModelCopyWith<$Res> {
  factory $NotepadModelCopyWith(
          NotepadModel value, $Res Function(NotepadModel) then) =
      _$NotepadModelCopyWithImpl<$Res, NotepadModel>;
  @useResult
  $Res call({int? id, String title, List<MemoModel> memoList});
}

/// @nodoc
class _$NotepadModelCopyWithImpl<$Res, $Val extends NotepadModel>
    implements $NotepadModelCopyWith<$Res> {
  _$NotepadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? memoList = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memoList: null == memoList
          ? _value.memoList
          : memoList // ignore: cast_nullable_to_non_nullable
              as List<MemoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotepadModelImplCopyWith<$Res>
    implements $NotepadModelCopyWith<$Res> {
  factory _$$NotepadModelImplCopyWith(
          _$NotepadModelImpl value, $Res Function(_$NotepadModelImpl) then) =
      __$$NotepadModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String title, List<MemoModel> memoList});
}

/// @nodoc
class __$$NotepadModelImplCopyWithImpl<$Res>
    extends _$NotepadModelCopyWithImpl<$Res, _$NotepadModelImpl>
    implements _$$NotepadModelImplCopyWith<$Res> {
  __$$NotepadModelImplCopyWithImpl(
      _$NotepadModelImpl _value, $Res Function(_$NotepadModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? memoList = null,
  }) {
    return _then(_$NotepadModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      memoList: null == memoList
          ? _value._memoList
          : memoList // ignore: cast_nullable_to_non_nullable
              as List<MemoModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotepadModelImpl implements _NotepadModel {
  const _$NotepadModelImpl(
      {this.id, required this.title, required final List<MemoModel> memoList})
      : _memoList = memoList;

  factory _$NotepadModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotepadModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  final List<MemoModel> _memoList;
  @override
  List<MemoModel> get memoList {
    if (_memoList is EqualUnmodifiableListView) return _memoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memoList);
  }

  @override
  String toString() {
    return 'NotepadModel(id: $id, title: $title, memoList: $memoList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotepadModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._memoList, _memoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_memoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotepadModelImplCopyWith<_$NotepadModelImpl> get copyWith =>
      __$$NotepadModelImplCopyWithImpl<_$NotepadModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotepadModelImplToJson(
      this,
    );
  }
}

abstract class _NotepadModel implements NotepadModel {
  const factory _NotepadModel(
      {final int? id,
      required final String title,
      required final List<MemoModel> memoList}) = _$NotepadModelImpl;

  factory _NotepadModel.fromJson(Map<String, dynamic> json) =
      _$NotepadModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  List<MemoModel> get memoList;
  @override
  @JsonKey(ignore: true)
  _$$NotepadModelImplCopyWith<_$NotepadModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
