import 'dart:async';
import 'dart:io';
import 'package:aws_s3_upload/aws_s3_upload.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:polaris_assignment/core/enum/form_type.dart';
import 'package:polaris_assignment/core/local_storage/hive/hive_config.dart';
import 'package:polaris_assignment/features/dynamic_form/data/models/dynamic_form_model.dart';
import 'package:polaris_assignment/features/dynamic_form/data/models/offline_form_data_model.dart';
import 'package:polaris_assignment/features/dynamic_form/domain/adaptor/adaptor.dart';
import 'package:polaris_assignment/features/dynamic_form/domain/entities/dynamic_form_view_model.dart';
import 'package:polaris_assignment/features/dynamic_form/domain/repositories/dynamic_form_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'dynamic_form_state.dart';

class DynamicFormCubit extends Cubit<DynamicFormState> {
  final DynamicFormRepository repository;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  DynamicFormCubit({required this.repository}) : super(DynamicFormLoading()) {
    _init();
    _getFormData();
    initHive();
  }

  late Box<OfflineFormDataModel> formBox;
  DynamicFormModel? model;

  final Map<String, dynamic> formValue = {};

  List<DynamicFormViewModel> _viewModel = [];
  String _formTitle = '';

  void initHive() async {
    formBox = Hive.box<OfflineFormDataModel>(HiveConfig.dynamicFormBox);
  }

  void _init() {
    connectivitySubscription = connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        if (model == null) {
          await _getFormData();
        }
        await _sendFormData();
      }
    });
  }

  Future<void> _getFormData() async {
    try {
      emit(DynamicFormLoading());
      model = await repository.getFormData();

      _emitState();
    } catch (e) {
      throw Exception(e);
    }
  }

  _emitState() async {
    if (model != null) {
      _formTitle = model!.formName;
      _viewModel =
          model!.fields.map((e) => Adaptor.convertFromModel(e)).toList();
      emit(DynamicFormLoading());
      await Future.delayed(const Duration(milliseconds: 200));
      emit(DynamicFormLoaded(
        model: _viewModel,
        formTitle: _formTitle,
        dateTime: DateTime.now().microsecondsSinceEpoch.toString(),
      ));
    }
  }

  Future<void> onFormSubmit(List<String> selectedImagesPath) async {
    final model = OfflineFormDataModel(data: {...formValue});
    var isFormSaved = await formBox.add(model);

    debugPrint("Saved to Hive! : $isFormSaved");

    formValue.clear();
    await _sendFormData();
  }

  dataOnChanges(String key, dynamic values) {
    formValue[key] = values;
  }

  bool validateForm(BuildContext context) {
    List<String?> mandatoryLabals = _viewModel.map((e) {
      if (e.mandatory && e.formType != FormType.editText) {
        return e.label;
      }
    }).toList();

    for (var element in mandatoryLabals) {
      if (element != null) {
        if (!formValue.containsKey(element)) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$element is required")));
          return false;
        }

        if (formValue.containsKey(element)) {
          final value = formValue[element];
          if (value == null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("$element is required")));
            return false;
          }
        }
      }
    }

    return true;
  }

  // Upload Images
  Future<void> uploadImagesToS3(List<File> images) async {
    for (File image in images) {
      final result = await AwsS3.uploadFile(
        accessKey: "AKIARUYJYFCSRJUWGKQY",
        secretKey: "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",
        file: image,
        bucket: "assignments-list",
        region: "ap-south-1",
        metadata: {"path": image.path},
      );
      debugPrint("Result: $result");
    }
  }

  Future<void> _sendFormData() async {
    final List<Map<String, dynamic>> data = [];
    //Fetch from local
    final formData = await _fetchLocalFormData();
    for (final e in formData) {
      data.add(e.data ?? {});
    }

    if (data.isNotEmpty) {
      final isSend = await repository.sendFormData({'data': data});
      if (isSend) {
        Fluttertoast.showToast(msg: "Form Submitted Successfully");
        formBox.clear();
        if (formValue.isEmpty) {
          await _getFormData();
        }
      } else {
        Fluttertoast.showToast(msg: "Form Submitted Successfully");
        _emitState();
      }
      debugPrint("is deta send $isSend");
    }
  }

  Future<List<OfflineFormDataModel>> _fetchLocalFormData() async {
    try {
      final inputDatas = formBox.values.toList();
      return inputDatas;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
