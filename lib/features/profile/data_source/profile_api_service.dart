import 'package:dio/dio.dart';

class ProfileApiService {
  final Dio _dio;

  ProfileApiService(this._dio);

  Future<Map<String, dynamic>> getUserProfile({required String token}) async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/account',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> updateUserProfile({
    required Map<String, dynamic> data,
    required String token,
  }) async {
    final response = await _dio.post(
      'https://api.themoviedb.org/3/account',
      data: data,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data;
  }

  Future<void> logout({required String token}) async {
    await _dio.post(
      'https://api.themoviedb.org/3/auth/logout',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }

  Future<Map<String, dynamic>> getPrivacyPolicy({required String token}) async {
    final response = await _dio.get(
      'https://api.themoviedb.org/3/privacy',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response.data;
  }
}
