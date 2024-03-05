import '../../data/models/dynamic_form_model.dart';

abstract class DynamicFormRepository {
  Future<DynamicFormModel> getFormData();
  Future<bool> sendFormData(Map<String, dynamic> formData);
}
