import 'package:cosnect/src/model/setting/app_setting.dart';
import 'package:cosnect/src/provider/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_setting_provider.g.dart';

@Riverpod(keepAlive: true)
class AppSetting extends _$AppSetting {
  late SharedPreferencesUtility _sharedPreferences;

  @override
  AppSettingData build() {
    _sharedPreferences = ref.read(sharedPreferencesProvider);
    AppSettingData appSettingData = _sharedPreferences.getAppSetting();
    return appSettingData;
  }

  Future<void> setLastNotepadId(int lastNotepadId) async {
    state = state.copyWith(
      lastNotepadId: lastNotepadId
    );
    await _sharedPreferences.setAppSetting(state);
  }

  Future<void> setDisplayMode(int displayMode) async {
    state = state.copyWith(
      displayMode: displayMode,
    );
    await _sharedPreferences.setAppSetting(state);
  }
}