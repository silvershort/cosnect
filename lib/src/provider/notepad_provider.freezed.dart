// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notepad_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotePadState {
  NotepadModel? get currentNote => throw _privateConstructorUsedError;
  List<NotepadModel> get noteList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotePadStateCopyWith<NotePadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotePadStateCopyWith<$Res> {
  factory $NotePadStateCopyWith(
          NotePadState value, $Res Function(NotePadState) then) =
      _$NotePadStateCopyWithImpl<$Res, NotePadState>;
  @useResult
  $Res call({NotepadModel? currentNote, List<NotepadModel> noteList});

  $NotepadModelCopyWith<$Res>? get currentNote;
}

/// @nodoc
class _$NotePadStateCopyWithImpl<$Res, $Val extends NotePadState>
    implements $NotePadStateCopyWith<$Res> {
  _$NotePadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentNote = freezed,
    Object? noteList = null,
  }) {
    return _then(_value.copyWith(
      currentNote: freezed == currentNote
          ? _value.currentNote
          : currentNote // ignore: cast_nullable_to_non_nullable
              as NotepadModel?,
      noteList: null == noteList
          ? _value.noteList
          : noteList // ignore: cast_nullable_to_non_nullable
              as List<NotepadModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotepadModelCopyWith<$Res>? get currentNote {
    if (_value.currentNote == null) {
      return null;
    }

    return $NotepadModelCopyWith<$Res>(_value.currentNote!, (value) {
      return _then(_value.copyWith(currentNote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotePadStateImplCopyWith<$Res>
    implements $NotePadStateCopyWith<$Res> {
  factory _$$NotePadStateImplCopyWith(
          _$NotePadStateImpl value, $Res Function(_$NotePadStateImpl) then) =
      __$$NotePadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotepadModel? currentNote, List<NotepadModel> noteList});

  @override
  $NotepadModelCopyWith<$Res>? get currentNote;
}

/// @nodoc
class __$$NotePadStateImplCopyWithImpl<$Res>
    extends _$NotePadStateCopyWithImpl<$Res, _$NotePadStateImpl>
    implements _$$NotePadStateImplCopyWith<$Res> {
  __$$NotePadStateImplCopyWithImpl(
      _$NotePadStateImpl _value, $Res Function(_$NotePadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentNote = freezed,
    Object? noteList = null,
  }) {
    return _then(_$NotePadStateImpl(
      currentNote: freezed == currentNote
          ? _value.currentNote
          : currentNote // ignore: cast_nullable_to_non_nullable
              as NotepadModel?,
      noteList: null == noteList
          ? _value._noteList
          : noteList // ignore: cast_nullable_to_non_nullable
              as List<NotepadModel>,
    ));
  }
}

/// @nodoc

class _$NotePadStateImpl implements _NotePadState {
  const _$NotePadStateImpl(
      {this.currentNote, final List<NotepadModel> noteList = const []})
      : _noteList = noteList;

  @override
  final NotepadModel? currentNote;
  final List<NotepadModel> _noteList;
  @override
  @JsonKey()
  List<NotepadModel> get noteList {
    if (_noteList is EqualUnmodifiableListView) return _noteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_noteList);
  }

  @override
  String toString() {
    return 'NotePadState(currentNote: $currentNote, noteList: $noteList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotePadStateImpl &&
            (identical(other.currentNote, currentNote) ||
                other.currentNote == currentNote) &&
            const DeepCollectionEquality().equals(other._noteList, _noteList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentNote, const DeepCollectionEquality().hash(_noteList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotePadStateImplCopyWith<_$NotePadStateImpl> get copyWith =>
      __$$NotePadStateImplCopyWithImpl<_$NotePadStateImpl>(this, _$identity);
}

abstract class _NotePadState implements NotePadState {
  const factory _NotePadState(
      {final NotepadModel? currentNote,
      final List<NotepadModel> noteList}) = _$NotePadStateImpl;

  @override
  NotepadModel? get currentNote;
  @override
  List<NotepadModel> get noteList;
  @override
  @JsonKey(ignore: true)
  _$$NotePadStateImplCopyWith<_$NotePadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
