import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting.freezed.dart';

part 'app_setting.g.dart';

@freezed
class AppSettingData with _$AppSettingData {
  const factory AppSettingData({
    @Default(0) int lastNotepadId,
    @Default(0) displayMode,
  }) = _AppSettingData;

  factory AppSettingData.fromJson(Map<String, dynamic> json) =>
      _$AppSettingDataFromJson(json);
}
