import 'dart:async';
import 'package:dio/dio.dart';

class NetworkSettings {
  static const url = 'https://beta.mrdekk.ru/todobackend';
  static const _mytoken = 'unanachronous';
  static const timeoutTime = 3;

  Dio? _dio;

  //final PersistenceUtil _persistenceUtil;

  //NetworkSettings({required persistenceUtil}) : _persistenceUtil = persistenceUtil;
  NetworkSettings();

  Dio dioInstance(int revision) {
    _dio ??= Dio(BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: timeoutTime),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_mytoken',
        }))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            options.headers['X-Last-Known-Revision'] = revision;
            handler.next(options);
          },
        ),
      );
    return _dio!;
  }

  Future<Response> get(String path) async {
    return dioInstance(0).get(path);
  }

  Future<Response> post(
      String path, Map<String, dynamic> data, int revision) async {
    return dioInstance(revision).post(path, data: data);
  }

  Future<Response> delete(String path, int revision) async {
    return dioInstance(revision).delete(path);
  }

  Future<Response> put(
      String path, Map<String, dynamic> data, int revision) async {
    return dioInstance(revision).put(path, data: data);
  }

  Future<Response> patch(
      String path, Map<String, dynamic> data, int revision) async {
    return dioInstance(revision).patch(path, data: data);
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
