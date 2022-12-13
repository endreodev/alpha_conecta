import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioServiceWs {
  static const String _url = 'http://localhost:21465/rest';

  static final Map<String, String> _mapHeaders = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Access-Control-Allow-Methods': '*',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': '*',
    // 'Authorization': 'Bearer' +
  };

  static final BaseOptions _options = BaseOptions(
    baseUrl: _url,
    connectTimeout: 15000,
    receiveTimeout: 15000,
    headers: _mapHeaders,
  );

  Dio oApi = Dio(_options);

  //instancia da classe
  static DioServiceWs? _servinstance;

  DioServiceWs._();

  static get instance {
    _servinstance ??= DioServiceWs._();
    return _servinstance;
  }
}
