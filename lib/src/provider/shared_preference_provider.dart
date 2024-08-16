import 'package:cosnect/src/util/constant/app_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_provider.g.dart';


@Riverpod(keepAlive: true)
SharedPreferencesUtility sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

class SharedPreferencesUtility {
  SharedPreferencesUtility(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  bool getUseTooltip() {
    return sharedPreferences.getBool(AppKey.tooltip) ?? true;
  }

  Future<void> setUseTooltip(bool useTooltip) async {
    await sharedPreferences.setBool(AppKey.tooltip, useTooltip);
  }

  bool getFirstAppRun() {
    return sharedPreferences.getBool(AppKey.firstAppRun) ?? true;
  }

  Future<void> setFirstAppRun(bool firstAppRun) async {
    await sharedPreferences.setBool(AppKey.firstAppRun, firstAppRun);
  }
}
