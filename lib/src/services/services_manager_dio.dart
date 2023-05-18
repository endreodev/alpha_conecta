import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesManagerDio {
  // static const String _baseUrl = 'http://localhost:21467/rest';
  static const String _baseUrl = 'http://45.174.195.28:21467/rest';

  static final Map<String, String> _mapHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': '*/*',
    'Access-Control-Allow-Methods': '*',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': '*',
    'User-Agent': 'ALPHACONECTAERP',
    // 'Authorization': 'Bearer' +
  };

  static final BaseOptions _options = BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: 6000,
    receiveTimeout: 6000,
    headers: _mapHeaders,
  );

  Dio oApi = Dio(_options);

  //instancia da classe
  static ServicesManagerDio? _servinstance;

  ServicesManagerDio._();

  static get instance {
    // final SharedPreferences share = await SharedPreferences.getInstance();
    // final accessToken = share.getString('token');

    _servinstance ??= ServicesManagerDio._();

    _servinstance?.oApi.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('oauth2')) {
        // final accessToken = AuthServiceLogin().getToken();
        final SharedPreferences share = await SharedPreferences.getInstance();
        final accessToken = share.getString('token');
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      return handler.next(options);
      // Do something before request is sent
      //return handler.next(options); //continue
      // If you want to resolve the request with some custom data?
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: `handler.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data?
      // you can resolve a `Response` object eg: `handler.resolve(response)`.
    }));

    return _servinstance;
  }
}
