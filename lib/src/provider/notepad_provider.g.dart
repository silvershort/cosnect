// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notepad_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notepadHash() => r'e43370ed82fd7d648abc5f2ed41f8a030b912443';

/// See also [Notepad].
@ProviderFor(Notepad)
final notepadProvider = NotifierProvider<Notepad, NotePadState>.internal(
  Notepad.new,
  name: r'notepadProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notepadHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Notepad = Notifier<NotePadState>;
String _$memoListHash() => r'36822f4cdf2325dc12d9f8911ee5579b59d060be';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
