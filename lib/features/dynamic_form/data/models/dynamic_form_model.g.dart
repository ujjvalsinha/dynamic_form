// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DynamicFormModelImpl _$$DynamicFormModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DynamicFormModelImpl(
      formName: json['form_name'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DynamicFormModelImplToJson(
        _$DynamicFormModelImpl instance) =>
    <String, dynamic>{
      'form_name': instance.formName,
      'fields': instance.fields,
    };

_$FieldImpl _$$FieldImplFromJson(Map<String, dynamic> json) => _$FieldImpl(
      componentType: json['component_type'] as String,
      metaInfo: MetaInfo.fromJson(json['meta_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FieldImplToJson(_$FieldImpl instance) =>
    <String, dynamic>{
      'component_type': instance.componentType,
      'meta_info': instance.metaInfo,
    };

_$MetaInfoImpl _$$MetaInfoImplFromJson(Map<String, dynamic> json) =>
    _$MetaInfoImpl(
      label: json['label'] as String,
      componentInputType: json['component_input_type'] as String?,
      mandatory: json['mandatory'] as String,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      noOfImagesToCapture: json['no_of_images_to_capture'] as int?,
      savingFolder: json['saving_folder'] as String?,
    );

Map<String, dynamic> _$$MetaInfoImplToJson(_$MetaInfoImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'component_input_type': instance.componentInputType,
      'mandatory': instance.mandatory,
      'options': instance.options,
      'no_of_images_to_capture': instance.noOfImagesToCapture,
      'saving_folder': instance.savingFolder,
    };
