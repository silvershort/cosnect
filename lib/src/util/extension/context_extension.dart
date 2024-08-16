import 'package:cosnect/generated/l10n.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  S get localization {
    return S.of(this);
  }
}
