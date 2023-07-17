import 'dart:async';
import 'package:dio/dio.dart';

class NetworkSettings {
  //static const url = String.fromEnvironment('base_url');
  //static const _mytoken = String.fromEnvironment('token');
  static const url = 'https://beta.mrdekk.ru/todobackend';
  static const _mytoken = 'unanachronous';
  static const timeoutTime = 3;

  Dio? _dio;

  //final PersistenceUtil _persistenceUtil;

  //NetworkSettings({required persistenceUtil}) : _persistenceUtil = persistenceUtil;
  NetworkSettings();

  Dio get dioInstance {
    _dio ??= Dio(BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: timeoutTime),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_mytoken',
        }));
    return _dio!;
  }

  Future<Response> get(String path) async {
    var result = dioInstance.get(path);
    return result;
  }

  Future<Response> post(
      String path, Map<String, dynamic> data, int revision) async {
    var dio = dioInstance;
    dio.options.headers['X-Last-Known-Revision'] = revision;
    return dio.post(path, data: data);
  }

  Future<Response> delete(String path, int revision) async {
    var dio = dioInstance;
    dio.options.headers['X-Last-Known-Revision'] = revision;
    return dio.delete(path);
  }

  Future<Response> put(
      String path, Map<String, dynamic> data, int revision) async {
    var dio = dioInstance;
    dio.options.headers['X-Last-Known-Revision'] = revision;
    return dioInstance.put(path, data: data);
  }

  Future<Response> patch(
      String path, Map<String, dynamic> data, int revision) async {
    var dio = dioInstance;
    dio.options.headers['X-Last-Known-Revision'] = revision;
    return dioInstance.patch(path, data: data);
  }

  /*Future<T> _request<T>(Future<T> Function() requestFunc) async {
    try {
      return await requestFunc();
    } on DioException catch (dioException) {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.cancel:
        case DioExceptionType.connectionError:
          throw NoInternetCustomException();
        case DioExceptionType.badResponse:
          throw ResponseCustomException('Bad response');
        default:
          if (dioException.error is SocketException) {
            throw NoInternetCustomException();
          } else {
            throw UnknownNetworkCustomException();
          }
      }
    } on SocketException catch (_) {
      throw NoInternetCustomException();
    } on Object catch (_) {
      throw UnknownNetworkCustomException();
    }
  }*/
}
