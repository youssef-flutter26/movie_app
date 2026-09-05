import 'package:dio/dio.dart';

class SearchApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey = '8a7ea096e125e0513be4c1ba951bd1bd';
  final Dio _dio;

  SearchApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final query = {'api_key': _apiKey, ...?queryParameters};
    var response = await _dio.get('$_baseUrl$endPoint', queryParameters: query);
    return response.data;
  }
}
