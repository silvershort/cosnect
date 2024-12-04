import 'package:cosnect/src/model/sns_info.dart';

extension StringExtension on String {
  // 이메일의 도메인 제거
  String get removeEmailDomain => split('@').first;
}

extension NullableStringExtension on String? {
  // 텍스트를 SNSInfo Enum값으로 변환 (기본값은 X)
  SNSInfo getSNSInfo() {
    final snsInfo = SNSInfo.values.where((element) => element.name == this).firstOrNull;
    return snsInfo ?? SNSInfo.x;
  }
}