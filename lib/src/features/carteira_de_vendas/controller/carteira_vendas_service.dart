import 'package:alpha_conecta/src/features/carteira_de_vendas/model/carteira_vendas_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/services_manager_dio.dart';

class CarteiraVendasService extends ChangeNotifier {
  bool isloading = false;
  bool isfalha = false;
  String msgerror = '';
  List<CarteiraVendasModel>? mapCarteiraVendas = <CarteiraVendasModel>[];

  CarteiraVendasService() {
    limpalistas();
  }

  limpalistas() {
    mapCarteiraVendas = <CarteiraVendasModel>[];
    msgerror = '';
    isfalha = false;
    isloading = false;
    notifyListeners();
  }

  consultaCarteiraVendas() async {
    Dio oFWRest = ServicesManagerDio.instance.oApi;

    isloading = true;
    notifyListeners();

    try {
      Response response =
          await oFWRest.get('/AlphaConectaMobileZV0/ListaAtendimentos');

      if (response.statusCode == 200) {
        // mapCarteiraVendas = CarteiraVendasModel.fromJson(response.data);
        // mapCarteiraVendas = <CarteiraVendasModel>[];

        if (response.data['ZV0'] != null) {
          mapCarteiraVendas = <CarteiraVendasModel>[];
          response.data['ZV0'].forEach((v) {
            mapCarteiraVendas!.add(CarteiraVendasModel.fromJson(v));
          });
        }

        msgerror = '';
        isloading = false;
        notifyListeners();
      } else {
        msgerror = 'Falha no carregamento';
        isloading = false;
        notifyListeners();
      }
    } on DioError catch (e) {
      msgerror = 'Falha no carregamento';
      isloading = false;
      notifyListeners();
    }
  }

  close() {
    mapCarteiraVendas = <CarteiraVendasModel>[];
    msgerror = '';
    isloading = false;
    notifyListeners();
  }
}
