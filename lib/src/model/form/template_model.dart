import 'package:cosnect/src/model/form/template_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_model.freezed.dart';

@freezed
class TemplateModel with _$TemplateModel {
  const factory TemplateModel({
    required String title,
    required TemplateType type,
  }) = _TemplateModel;
}
