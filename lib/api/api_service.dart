import 'package:cari_atap/helper/dio_helper.dart';
import 'package:cari_atap/model/base_model.dart';
import 'package:cari_atap/model/home_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://35.225.241.252:3000';

  final Dio dio = Dio();

  ApiService() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<HomeModel> fetchHome(String query) async {
    const String url = "$baseUrl/homes/search";
    try {
      final response = await dio.get(
        url,
        queryParameters: {
          "limit": 10,
          "page": 1,
          "q" : query,
        },
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );
      return HomeModel.fromJson(response.data);
    } on DioException catch (e) {
      return DioErrorHandler.handleWithParser<HomeModel>(
        e,
        (json) => HomeModel.fromJson(json),
      );
    }
  }

  Future<BaseModel> fetchConfirmation(String confirmationId) async {
    const String url = "$baseUrl/user/confirmation";
    try {
      final response = await dio.get("$url/$confirmationId");
      if (response.statusCode == 200) {
        return BaseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to Confirmation : ${response.statusCode}');
      }
    } on DioException catch (e) {
      return DioErrorHandler.handleWithParser<BaseModel>(
        e,
        (json) => BaseModel.fromJson(json),
      );
    }
  }

  Future<BaseModel> fetchRegister(
    String name,
    String email,
    String password,
    String role,
  ) async {
    const String url = "$baseUrl/user/register";
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
        throw Exception('Failed to Register : ${response.statusCode}');
      }
    } on DioException catch (e) {
      return DioErrorHandler.handleWithParser<BaseModel>(
        e,
        (json) => BaseModel.fromJson(json),
      );
    }
  }

  Future<BaseModel> fetchLogin(String email, String password) async {
    const String url = "$baseUrl/user/login";
    try {
      final response = await dio.post(
        url,
        data: {'email': email, 'password': password},
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
        ),
      );

      if (response.statusCode == 200) {
        return BaseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to Login : ${response.data}');
      }
    } on DioException catch (e) {
      return DioErrorHandler.handleWithParser<BaseModel>(
        e,
        (json) => BaseModel.fromJson(json),
      );
    }
  }
}
