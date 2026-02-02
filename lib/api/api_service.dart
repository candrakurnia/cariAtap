import 'package:cari_atap/model/base_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://35.225.241.252:3000';

  final Dio dio = Dio();

  ApiService() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        responseHeader: true,
        requestHeader: true,
      ),
    );
  }

  Future<BaseModel> fetchLogin(String email, String password) async {
    const String url = '$baseUrl/user/login';
    try {
      final response = await dio.post(
        url,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return BaseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login ${response.statusMessage}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<BaseModel> fetchRegister(
    String name,
    String email,
    String password,
    String role,
  ) async {
    const String url = '$baseUrl/user/register';
    try {
      final response = await dio.post(
        url,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );
      if (response.statusCode == 201) {
        return BaseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to register');
      }
    } on DioException catch (e) {
      throw Exception('Failed to register: $e');
    }
  }

  Future<Response> put(String url, dynamic data) async {
    return await dio.put(url, data: data);
  }

  Future<Response> delete(String url) async {
    return await dio.delete(url);
  }
}
