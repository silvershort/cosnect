import 'package:cosnect/src/model/sns_info.dart';
import 'package:cosnect/src/repository/memo_database.dart';
import 'package:cosnect/src/util/extension/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coser_model.freezed.dart';

part 'coser_model.g.dart';

@freezed
class CoserModel with _$CoserModel {
  const factory CoserModel({
    required int id,
    String? snsId,
    @Default(SNSInfo.x) SNSInfo sns,
    String? email,
  }) = _CoserModel;

  const CoserModel._();

  String getCoserAddress() {
    if (snsId?.isNotEmpty ?? false) {
      return snsId!;
    } else {
      return email ?? '';
    }
  }

  factory CoserModel.fromItem(CoserItem item) {
    return CoserModel(
      id: item.id,
      email: item.email,
      sns: item.sns?.getSNSInfo() ?? SNSInfo.x,
      snsId: item.snsId,
    );
  }

  factory CoserModel.fromJson(Map<String, dynamic> json) => _$CoserModelFromJson(json);
}
