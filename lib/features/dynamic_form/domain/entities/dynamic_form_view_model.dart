import 'package:flutter/material.dart';
import 'package:polaris_assignment/core/enum/form_type.dart';

class DynamicFormViewModel {
  final FormType formType;
  final bool mandatory;
  final String label;
  final List<String>? options;
  final int? imageCount;
  final TextInputType? textInputType;
  final String? savingFolder;
  final String? inputData;

  DynamicFormViewModel({
    required this.formType,
    required this.mandatory,
    required this.label,
    this.options,
    this.imageCount,
    this.textInputType,
    this.savingFolder,
    this.inputData,
  });

  DynamicFormViewModel copyWith({
    FormType? formType,
    bool? mandatory,
    String? label,
    List<String>? options,
    int? imageCount,
    TextInputType? textInputType,
    String? savingFolder,
    String? inputData,
  }) =>
      DynamicFormViewModel(
        formType: formType ?? this.formType,
        mandatory: mandatory ?? this.mandatory,
        label: label ?? this.label,
        options: options ?? this.options,
        imageCount: imageCount ?? this.imageCount,
        textInputType: textInputType ?? this.textInputType,
        savingFolder: savingFolder ?? this.savingFolder,
        inputData: inputData ?? this.inputData,
      );
}
