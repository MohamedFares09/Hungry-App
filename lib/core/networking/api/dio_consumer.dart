import 'package:dio/dio.dart';
import 'package:hungry_app/core/networking/api/api_consumer.dart';
import 'package:hungry_app/core/networking/errors/error_model.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio);
  @override
  Future delete(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.sendTimeout:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.receiveTimeout:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.badCertificate:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.cancel:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.connectionError:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );
        case DioExceptionType.unknown:
          throw ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          );

        case DioExceptionType.badResponse:
          switch (e.response!.statusCode) {
            case 400:
              throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data),
              );
            case 401:
              throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data),
              );
            case 403:
              throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data),
              );
            case 404:
              throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data),
              );
            case 500:
              throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data),
              );
            default:
              throw ServerException(
                errorModel: ErrorModel.fromJson(e.response!.data),
              );
          }
      }
    }
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) {
    throw UnimplementedError();
  }
}
