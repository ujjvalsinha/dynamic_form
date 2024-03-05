import 'package:get_it/get_it.dart';
import 'package:polaris_assignment/core/services/network_service/dio_service.dart';
import 'package:polaris_assignment/core/services/network_service/http_service.dart';

import '../../features/dynamic_form/data/datasources/remote/remote_data_source.dart';
import '../../features/dynamic_form/data/repositories/dynamic_form_repository_imp.dart';

GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerLazySingleton<HttpService>(() => DioHttpService());

  getIt.registerFactory<RemoteDataSourceImplementation>(
      () => RemoteDataSourceImplementation(getIt.get<HttpService>()));

  getIt.registerFactory<DynamicFormRepositoryImplementation>(() =>
      DynamicFormRepositoryImplementation(
          remoteDataSource: getIt.get<RemoteDataSourceImplementation>()));
}
