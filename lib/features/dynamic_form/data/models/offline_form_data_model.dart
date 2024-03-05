import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'offline_form_data_model.freezed.dart';
part 'offline_form_data_model.g.dart';

@HiveType(typeId: 0)
@freezed
class OfflineFormDataModel with _$OfflineFormDataModel {
  factory OfflineFormDataModel({
    @HiveField(0) Map<String, dynamic>? data,
  }) = _OfflineFormDataModel;

  factory OfflineFormDataModel.fromJson(Map<String, dynamic> json) =>
      _$OfflineFormDataModelFromJson(json);
}
