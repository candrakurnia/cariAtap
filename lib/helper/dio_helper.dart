import 'package:dio/dio.dart';

class DioErrorHandler {
  static getErrorCode(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ('Connection timeout. Please try again later.');
      case DioExceptionType.sendTimeout:
        return ('Send timeout. Please try again.');
      case DioExceptionType.receiveTimeout:
        return ('Receive timeout. Please try again.');
      case DioExceptionType.connectionError:
        return ('No internet connection. Please check your network.');
      case DioExceptionType.badResponse:
        return (
          // e.response?.data.error?.message ??
          'Unexpected error occurred. Please try again.',
        );
      case DioExceptionType.cancel:
        return ('Request was cancelled.');
      case DioExceptionType.unknown:
      default:
        return ('Unexpected error: ${e.message}');
    }
  }

  static T handleWithParser<T>(
    DioException e,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (e.type == DioExceptionType.badResponse &&
            e.response?.statusCode == 400 ||
        e.response?.statusCode == 429 && e.response?.data != null) {
      return fromJson(e.response!.data);
    }
    throw Exception(getErrorCode(e));
  }
}
