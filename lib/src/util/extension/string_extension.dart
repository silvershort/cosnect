extension StringExtension on String {
  // 이메일의 도메인 제거
  String get removeEmailDomain => split('@').first;
}