import 'package:alpha_conecta/controller/dio_service_ws.dart';
import 'package:alpha_conecta/validates/myshow_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class AuthService extends ChangeNotifier {
  User? usuario;
  bool isloading = false;
  String msgError = '';

  AuthService() {
    _authCheck();
  }

  _authCheck() async {
    // //criar rotina para consultar api login
    // await Future.delayed(const Duration(seconds: 5));
    // isloading = false;
    // notifyListeners();
  }

  login(String usuario, String senha, BuildContext cnx) async {
    //Start loand
    msgError = "";
    isloading = true;
    notifyListeners();

    Dio oFWRest = DioServiceWs.instance.oApi;

    try {
      Response response = await oFWRest.post(
        '/api/oauth2/v1/token?grant_type=password',
        data: {},
        queryParameters: {'password': usuario, 'username': senha},
      );

      final oToken = Token.fromJson(response.data);

      await Save(oToken);

      // Map<String, dynamic> dadosUser = {};
      // dadosUser['name'] = usuario;
      // dadosUser['password'] = senha;

      // usuario = User.fromJson(dadosUser);
      msgError = "";
      isloading = false;
      notifyListeners();
      //
    } on DioError catch (e) {
      isloading = false;
      notifyListeners();

      if (e.response != null) {
        if (e.response!.statusCode! >= 400 || e.response!.statusCode! <= 499) {
          msgError = e.response!.statusMessage.toString();
          isloading = false;
          notifyListeners();
        }
      } else {
        if (e.message.contains('Connection refused')) {
          // SnackMenssageWarning(e.message);
          msgError = 'Falha na conexao com o servidor! Connection refused!';
          isloading = false;
          notifyListeners();
        } else {
          // SnackMenssageWarning(e.message);
          msgError = e.message;
          isloading = false;
          notifyListeners();
        }
      }
    }
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
