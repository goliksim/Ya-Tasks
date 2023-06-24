import 'package:dio/dio.dart';
import 'package:ya_todolist/feature/task/data/api/model/task_api.dart';

class NetworkManager {
  NetworkManager();

  static const _baseURL = 'https://beta.mrdekk.ru/todobackend/list';
  static const _mytoken = 'unanachronous';
  static int _lastRevision = 0;
  late Response response;
  //static const _listUrl = '/list';

  final Dio dio = Dio(
    BaseOptions(baseUrl: _baseURL, headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $_mytoken',
    }),
  );

  Map<String, String> get headers => {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $_mytoken',
        'X-Last-Known-Revision': '$_lastRevision',
      };

  Future<int> getRevision() async {
    try {
      response = await dio.get<Map<String, dynamic>>(_baseURL);
    } catch (e) {
      return 0;
    }
    if (response.statusCode == 200) {
      var jsonResponce = response.data!;
      _lastRevision = jsonResponce['revision'];
      dio.options.headers['X-Last-Known-Revision'] = '$_lastRevision';
    }
    return _lastRevision;
  }

  Future<List<ApiTask>?> getData() async {
    //var url = _BASE_URL + _listUrl;
    try {
      response = await dio.get<Map<String, dynamic>>(_baseURL);
    } catch (e) {
      return null;
    }
    if (response.statusCode == 200) {
      var jsonResponce = response.data!;
      _lastRevision = jsonResponce['revision'];
      dio.options.headers['X-Last-Known-Revision'] = '$_lastRevision';

      return [for (var item in jsonResponce['list']) ApiTask.fromApi(item)];
    }
    return null;
  }

  Future<ApiTask?> getTask(String id) async {
    try {
      response = await dio.get<Map<String, dynamic>>('$_baseURL/$id');
    } catch (e) {
      return null;
    }
    if (response.statusCode == 200) {
      var jsonResponce = response.data!;
      _lastRevision = jsonResponce['revision'];
      return ApiTask.fromApi(jsonResponce['element']);
    }
    return null;
  }

  Future<bool> patchData(List<Map<String, dynamic>> listApiTask) async {
    await getRevision();
    try {
      response = await dio.patch<Map<String, dynamic>>(_baseURL, data: {
        'list': listApiTask,
      });
    } catch (e) {
      return false;
    }
    if (response.statusCode == 200) {
      _lastRevision += 1;
      return true;
    }
    return false;
  }

  Future<bool> postTask(Map<String, dynamic> apiTask) async {
    await getRevision();
    try {
      response = await dio.post(
        _baseURL,
        data: {
          'element': apiTask,
        },
      );
    } catch (e) {
      return false;
    }
    if (response.statusCode == 200) {
      _lastRevision += 1;
      return true;
    }
    return false;
  }
}
