import 'package:hive/hive.dart';

part 'offline_form_data_model.g.dart';

@HiveType(typeId: 0)
class OfflineFormDataModel extends HiveObject {
  @HiveField(0)
  final Map<String, dynamic>? data;

  OfflineFormDataModel({required this.data});
}
