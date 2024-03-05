// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'dynamic_form_model.freezed.dart';
part 'dynamic_form_model.g.dart';

@freezed
class DynamicFormModel with _$DynamicFormModel {
  const factory DynamicFormModel({
    @JsonKey(name: 'form_name') required String formName,
    required List<Field> fields,
  }) = _DynamicFormModel;

  factory DynamicFormModel.fromJson(Map<String, Object?> json) =>
      _$DynamicFormModelFromJson(json);
}

@freezed
class Field with _$Field {
  const factory Field({
    @JsonKey(name: 'component_type') required String componentType,
    @JsonKey(name: 'meta_info') required MetaInfo metaInfo,
  }) = _Field;

  factory Field.fromJson(Map<String, Object?> json) => _$FieldFromJson(json);
}

@freezed
class MetaInfo with _$MetaInfo {
  const factory MetaInfo({
    required String label,
    @JsonKey(name: 'component_input_type') String? componentInputType,
    required String mandatory,
    List<String>? options,
    @JsonKey(name: 'no_of_images_to_capture') int? noOfImagesToCapture,
    @JsonKey(name: 'saving_folder') String? savingFolder,
  }) = _MetaInfo;

  factory MetaInfo.fromJson(Map<String, Object?> json) =>
      _$MetaInfoFromJson(json);
}
