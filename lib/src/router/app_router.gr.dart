// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:cosnect/src/model/form/memo_model.dart' as _i8;
import 'package:cosnect/src/ui/screen/form_screen.dart' as _i1;
import 'package:cosnect/src/ui/screen/home_screen.dart' as _i2;
import 'package:cosnect/src/ui/screen/memo_update_screen.dart' as _i3;
import 'package:cosnect/src/ui/screen/memory_screen.dart' as _i4;
import 'package:cosnect/src/ui/screen/onboarding_screen.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.FormScreen]
class FormRoute extends _i6.PageRouteInfo<FormRouteArgs> {
  FormRoute({
    _i7.Key? key,
    bool character = false,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          FormRoute.name,
          args: FormRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'FormRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<FormRouteArgs>(orElse: () => const FormRouteArgs());
      return _i1.FormScreen(
        key: args.key,
        character: args.character,
      );
    },
  );
}

class FormRouteArgs {
  const FormRouteArgs({
    this.key,
    this.character = false,
  });

  final _i7.Key? key;

  final bool character;

  @override
  String toString() {
    return 'FormRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.MemoUpdateScreen]
class MemoUpdateRoute extends _i6.PageRouteInfo<MemoUpdateRouteArgs> {
  MemoUpdateRoute({
    _i7.Key? key,
    required _i8.MemoModel memoModel,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          MemoUpdateRoute.name,
          args: MemoUpdateRouteArgs(
            key: key,
            memoModel: memoModel,
          ),
          initialChildren: children,
        );

  static const String name = 'MemoUpdateRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MemoUpdateRouteArgs>();
      return _i3.MemoUpdateScreen(
        key: args.key,
        memoModel: args.memoModel,
      );
    },
  );
}

class MemoUpdateRouteArgs {
  const MemoUpdateRouteArgs({
    this.key,
    required this.memoModel,
  });

  final _i7.Key? key;

  final _i8.MemoModel memoModel;

  @override
  String toString() {
    return 'MemoUpdateRouteArgs{key: $key, memoModel: $memoModel}';
  }
}

/// generated route for
/// [_i4.MemoryScreen]
class MemoryRoute extends _i6.PageRouteInfo<void> {
  const MemoryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MemoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'MemoryRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.MemoryScreen();
    },
  );
}

/// generated route for
/// [_i5.OnboardingScreen]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingScreen();
    },
  );
}
