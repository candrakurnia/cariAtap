import 'package:cari_atap/model/base_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://35.225.241.252:3000';

  final Dio dio = Dio();

  ApiService() {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
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
        throw Exception('Failed to Login : ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to Login : ${e.response?.statusCode}');
    }
  }
}
