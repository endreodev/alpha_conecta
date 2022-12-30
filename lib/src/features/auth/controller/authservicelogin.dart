import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:alpha_conecta/src/features/auth/model/tokem_model.dart';
import 'package:alpha_conecta/src/features/auth/model/user_model.dart';
import 'package:alpha_conecta/src/services/services_manager_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceLogin extends ChangeNotifier {
  AuthServiceLogin() {
    _authCheck();
  }

  UserModel? usuario;
  bool isloading = false;
  String msgError = '';

  //verifica se ja tem acesso anteriormente
  _authCheck() async {
    isloading = true;
    notifyListeners();

    final SharedPreferences share = await SharedPreferences.getInstance();
    final String name = share.getString('userData') ?? '';
    final String senha = share.getString('pswData') ?? '';
    final String ctoken = await getToken() ?? '';

    if (ctoken.isNotEmpty) {
      //monta model de usuario
      Map<String, dynamic> user = {};
      user['name'] = name;
      user['password'] = senha;
      usuario = UserModel.fromJson(user);
    } else {
      usuario = null;
    }

    msgError = "";
    isloading = false;
    notifyListeners();
  }

  //acao de login com usuario e senha
  login(String userlogin, String senhalogin, BuildContext cnx) async {
    //Start loand
    msgError = "";
    isloading = true;
    notifyListeners();

    Dio oFWRest = ServicesManagerDio.instance.oApi;

    try {
      Response response = await oFWRest.post(
        '/api/oauth2/v1/token?grant_type=password',
        data: {},
        queryParameters: {'password': userlogin, 'username': senhalogin},
      );

      final oToken = TokenModel.fromJson(response.data);

      if (response.statusCode != 201) {
        //se erro define mensagem
        msgError = oToken.message.toString();
        isloading = false;
        notifyListeners();
      } else {
        //salva os dados de acesso
        await saveDados(oToken, userlogin, senhalogin);

        //monta model de user
        Map<String, dynamic> user = {};
        user['name'] = 'endreo';
        user['password'] = 'Senha';
        usuario = UserModel.fromJson(user);

        //Stop loand
        msgError = "";
        isloading = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode! >= 400 || e.response!.statusCode! <= 499) {
          final oToken = TokenModel.fromJson(e.response!.data);

          msgError = oToken.message
              .toString()
              .replaceAll(RegExp(r'invalid_grant'), '');
          isloading = false;
          notifyListeners();
        }
      } else {
        if (e.message.contains('Connection refused')) {
          msgError = 'Falha na conexao com o servidor! Connection refused!';
          isloading = false;
          notifyListeners();
        } else {
          msgError = e.message.toString();
          isloading = false;
          notifyListeners();
        }
      }
    }
  }

  saveDados(TokenModel oLogin, String userData, String pswDAta) async {
    final SharedPreferences share = await SharedPreferences.getInstance();
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final int horaNow = timestamp + oLogin.expires_in!.toInt();

    await share.setString('token', oLogin.access_token.toString());
    await share.setString('refresh', oLogin.refresh_token.toString());
    await share.setInt('expires_in', oLogin.expires_in!.toInt());
    await share.setInt('expiresnow', horaNow);
    await share.setString('userData', userData);
    await share.setString('pswData', pswDAta);
  }

  getToken() async {
    String ctoken = '';
    final SharedPreferences share = await SharedPreferences.getInstance();
    final int timestamp = DateTime.now().millisecondsSinceEpoch;
    final int horavenc = share.getInt('expiresnow') ?? 0;

    if (horavenc > timestamp) {
      ctoken = share.getString('token') ?? '';
    } else {
      ctoken = await refreshtoken() ?? '';
    }

    return ctoken;
  }

  refreshtoken() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    Dio oFWRestRefresh = ServicesManagerDio.instance.oApi;
    String ctoken = '';
    final refreshToken = share.getString('refresh') ?? '';

    if (refreshToken.isNotEmpty) {
      try {
        //
        Response response = await oFWRestRefresh.post(
          '/api/oauth2/v1/token?grant_type=refresh_token',
          data: {},
          queryParameters: {
            'refresh_token': refreshToken,
          },
        );

        final oToken = TokenModel.fromJson(response.data);

        if (oToken.code != null) {
        } else {
          ctoken = share.getString('token') ?? '';
        }
      } catch (e) {
        ctoken = '';
      }
    }
    return ctoken;
  }

  userlogoff() async {
    final SharedPreferences share = await SharedPreferences.getInstance();

    await share.remove('token');
    await share.remove('refresh');
    await share.remove('expires_in');
    await share.remove('expiresnow');
    await share.remove('userData');
    await share.remove('pswData');

    usuario = null;
    msgError = '';
    isloading = false;
    notifyListeners();
  }
}
