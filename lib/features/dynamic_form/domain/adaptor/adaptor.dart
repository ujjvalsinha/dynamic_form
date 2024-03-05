import 'package:flutter/material.dart';
import 'package:polaris_assignment/core/enum/form_type.dart';
import 'package:polaris_assignment/features/dynamic_form/data/models/dynamic_form_model.dart';
import 'package:polaris_assignment/features/dynamic_form/domain/entities/dynamic_form_view_model.dart';

class Adaptor {
  static DynamicFormViewModel convertFromModel(Field model) {
    return DynamicFormViewModel(
      formType: convertFromString(model.componentType),
      mandatory: convertToBool(model.metaInfo.mandatory),
      label: model.metaInfo.label,
      imageCount: model.metaInfo.noOfImagesToCapture,
      options: model.metaInfo.options,
      savingFolder: model.metaInfo.savingFolder,
      // textInputType:
      //     convertStringToInputType(model.metaInfo.componentInputType)
    );
  }

  static FormType convertFromString(String name) {
    if (name == "EditText") {
      return FormType.editText;
    } else if (name == "CheckBoxes") {
      return FormType.checkBoxes;
    } else if (name == "DropDown") {
      return FormType.dropDown;
    } else if (name == "RadioGroup") {
      return FormType.radioGroup;
    } else if (name == "CaptureImages") {
      return FormType.captureImages;
    }

    throw Exception("INVALID TYPE");
  }

  static bool convertToBool(String data) {
    if (data.toLowerCase() == "no") {
      return false;
    } else if (data.toLowerCase() == "yes") {
      return true;
    }

    throw Exception("INVALID DATA");
  }

  static TextInputType convertStringToInputType(String? type) {
    if (type == null) {
      return TextInputType.none;
    }
    if (type == "TEXT") {
      return TextInputType.text;
    } else if (type == "INTEGER") {
      return TextInputType.number;
    }

    throw Exception("INVALID DATA");
  }
}
