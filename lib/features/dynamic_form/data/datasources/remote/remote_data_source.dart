import 'package:dio/dio.dart';
import 'package:polaris_assignment/core/app_configs/api_routes.dart';
import 'package:polaris_assignment/core/error/polaris_custom_error.dart';
import 'package:polaris_assignment/core/services/network_service/http_service.dart';

import '../../models/dynamic_form_model.dart';

abstract class RemoteDataSource {
  Future<DynamicFormModel> getFormDataFromRemote();
  Future<bool> sendFormDataToRemote(Map<String, dynamic> formData);
}

class RemoteDataSourceImplementation extends RemoteDataSource {
  final HttpService _httpService;

  RemoteDataSourceImplementation(this._httpService);

  @override
  Future<DynamicFormModel> getFormDataFromRemote() async {
    try {
      final Response response =
          await _httpService.handleGetRequest(ApiRoutes.dynamicForm);
      if (response.statusCode == 200) {
        final DynamicFormModel model = DynamicFormModel.fromJson(response.data);
        return model;
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      throw PolarisCustomError(
        code: e.response?.statusCode.toString(),
        message: "There was an error fetching Form Data",
      );
    }
  }

  @override
  Future<bool> sendFormDataToRemote(Map<String, dynamic> formData) async {
    try {
      final response = await _httpService
          .handlePostRequest(ApiRoutes.sendFormData, data: formData);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      throw PolarisCustomError(
        code: e.response?.statusCode.toString(),
        message: "There was an error fetching Form Data",
      );
    }
  }
}
