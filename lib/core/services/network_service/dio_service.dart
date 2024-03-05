import 'package:dio/dio.dart';
import 'package:polaris_assignment/core/services/network_service/http_service.dart';

// DioHttpService class extending HttpService
class DioHttpService extends HttpService {
  late Dio _dio;
  String? appVersion;
  String? authToken;
  String platform = "";

//Next three lines makes this class singleton
  static final DioHttpService _instance = DioHttpService.internal();
  factory DioHttpService() => _instance;

  DioHttpService.internal() {
    _dio = Dio(BaseOptions(connectTimeout: const Duration(milliseconds: 10000)))
      ..interceptors.add(LogInterceptor(
          request: true,
          requestBody: false,
          requestHeader: false,
          responseBody: false,
          responseHeader: false));
  }

  @override
  Future<Response> handleGetRequest(String? path) async {
    // Make a GET request with the specified path and options
    return await _dio.get(path!, options: await getOptionWithToken());
  }

  @override
  Future<Response> handlePostRequest(String path,
      {Options? options, Map<String, dynamic>? data}) async {
    // Make a POST request with the specified path, data, and options
    return await _dio.post(
      path,
      data: data,
      options: options,
    );
  }

  @override
  Future<Response> handlePutRequest(String path,
      {Options? options, Map<String, dynamic>? data}) async {
    // Make a PUT request with the specified path, data, and options
    return await _dio.put(
      path,
      data: data,
      options: options,
    );
  }

  @override
  Future<Response> handleDeleteRequest(String path) async {
    return _dio.delete(path, options: await getOptionWithToken());
  }

  @override
  Future<Response> handleGetRequestWithoutToken(String path) async {
    return await _dio.get(path, options: getOptionWithoutToken());
  }

  @override
  Future<Response> handlePostRequestWithoutToken(String path,
      [Map<String, dynamic>? data]) async {
    return await _dio.post(path, data: data, options: getOptionWithoutToken());
  }

  @override
  Future<Response> handlePutRequestWithoutToken(String path,
      [Map<String, dynamic>? data]) async {
    return await _dio.put(path, data: data, options: getOptionWithoutToken());
  }

  @override
  Future<Response> handleDeleteRequestWithoutToken(String path) async {
    return _dio.delete(path, options: getOptionWithoutToken());
  }

  @override
  Future<Response> handlePostRequestList(String path, List? data) async {
    return await _dio.post(path,
        data: data, options: await getOptionWithToken());
  }

  Future<Options> getOptionWithToken() async {
    //call a function for token
    return Options();
  }

  Options getOptionWithoutToken() {
    return Options(
      headers: {"x-app-version": appVersion, "platform": platform},
    );
  }
}
