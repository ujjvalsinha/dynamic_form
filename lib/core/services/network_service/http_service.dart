import 'package:dio/dio.dart';

// Abstract class for a network service

abstract class HttpService {
  Future<Response> handleGetRequest(String? path);
  Future<Response> handlePostRequest(String path,
      {Options? options, Map<String, dynamic>? data});
  Future<Response> handlePostRequestList(String path, List<dynamic>? data);
  Future<Response> handlePutRequest(String path,
      {Options? options, Map<String, dynamic>? data});
  Future<Response> handleDeleteRequest(String path);

  Future<Response> handleGetRequestWithoutToken(String path);
  Future<Response> handlePostRequestWithoutToken(String path,
      [Map<String, dynamic>? data]);
  Future<Response> handlePutRequestWithoutToken(String path,
      [Map<String, dynamic>? data]);
  Future<Response> handleDeleteRequestWithoutToken(String path);
}
