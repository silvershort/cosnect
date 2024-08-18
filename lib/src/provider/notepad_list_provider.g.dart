// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notepad_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notepadListHash() => r'570926943de03c7b3239c7e2e42634c1c4c7f099';

/// See also [NotepadList].
@ProviderFor(NotepadList)
final notepadListProvider =
    AutoDisposeNotifierProvider<NotepadList, List<NotepadModel>>.internal(
  NotepadList.new,
  name: r'notepadListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notepadListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotepadList = AutoDisposeNotifier<List<NotepadModel>>;
String _$memoListHash() => r'0ff806cc82deb25095be7d8a73dafbafca361ad4';

/// See also [MemoList].
@ProviderFor(MemoList)
final memoListProvider =
    AutoDisposeNotifierProvider<MemoList, List<MemoModel>>.internal(
  MemoList.new,
  name: r'memoListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$memoListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MemoList = AutoDisposeNotifier<List<MemoModel>>;
String _$notepadHash() => r'ef35a3ebaf326913b1eec4feeb00ecc6f2398bae';

/// See also [Notepad].
@ProviderFor(Notepad)
final notepadProvider =
    AutoDisposeNotifierProvider<Notepad, NotepadModel>.internal(
  Notepad.new,
  name: r'notepadProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notepadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Notepad = AutoDisposeNotifier<NotepadModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
