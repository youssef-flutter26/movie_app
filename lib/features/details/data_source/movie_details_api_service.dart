import 'package:dio/dio.dart';

class MovieDetailsApiService {
  final String _baseUrl = 'https://api.themoviedb.org/3/';
  final String _apiKey = '8a7ea096e125e0513be4c1ba951bd1bd';
  final Dio _dio;

  MovieDetailsApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: {'api_key': _apiKey},
    );
    return response.data;
  }
}
