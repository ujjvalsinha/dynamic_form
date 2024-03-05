import 'package:polaris_assignment/features/dynamic_form/data/models/dynamic_form_model.dart';
import 'package:polaris_assignment/features/dynamic_form/domain/repositories/dynamic_form_repository.dart';

import '../datasources/remote/remote_data_source.dart';

class DynamicFormRepositoryImplementation extends DynamicFormRepository {
  final RemoteDataSource remoteDataSource;

  DynamicFormRepositoryImplementation({required this.remoteDataSource});
  @override
  Future<DynamicFormModel> getFormData() async {
    return await remoteDataSource.getFormDataFromRemote();
  }

  @override
  Future<bool> sendFormData(Map<String, dynamic> formData) async {
    return await remoteDataSource.sendFormDataToRemote(formData);
  }
}
