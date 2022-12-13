import 'package:alpha_conecta/controller/dio_service_ws.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class AuthService extends ChangeNotifier {
  User? usuario;
  bool isloading = true;

  AuthService() {
    _authCheck();
  }

  login(String usuario, String senha) async {
    //Start loand
    isloading = true;
    notifyListeners();

    Dio oFWRest = DioServiceWs.instance.oApi;

    try {
      Response response = await oFWRest.post(
        '/api/oauth2/v1/token?',
        data: {},
        queryParameters: {
          'grant_type': 'password',
          'password': usuario,
          'username': senha
        },
      );

      final oToken = Token.fromJson(response.data);

      await Save(oToken);

      Map<String, dynamic> dadosUser = {'name': usuario, 'password': senha};

      usuario = User.fromJson(dadosUser) as String;

      isloading = false;
      notifyListeners();
      //
    } on DioError catch (e) {
      isloading = false;
      notifyListeners();

      if (e.response != null) {
        if (e.response!.statusCode! >= 400 || e.response!.statusCode! <= 499) {
          // oLoginRest = InterfaceLogin.fromJson(e.response!.data);
          // SnackMenssageWarning(oLoginRest.message.toString());
        }

        return false;
      } else {
        if (e.message.contains('Connection failed')) {
          // SnackMenssageWarning('Falha na conexão com servidor.');
        } else {
          // SnackMenssageWarning(e.message);
        }
      }
    }
  }

  _authCheck() async {
    //criar rotina para consultar api login
    await Future.delayed(const Duration(seconds: 5));
    isloading = false;
    notifyListeners();
  }

  Future Save(Token oLogin) async {
    final SharedPreferences share = await SharedPreferences.getInstance();

    await share.setString('token', oLogin.accessToken.toString());
    await share.setString('refresh', oLogin.refreshToken.toString());
    await share.setInt('expire', oLogin.expiresIn!);
  }
}

class Token {
  String? accessToken;
  String? refreshToken;
  String? scope;
  String? tokenType;
  int? expiresIn;

  Token(
      {this.accessToken,
      this.refreshToken,
      this.scope,
      this.tokenType,
      this.expiresIn});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
