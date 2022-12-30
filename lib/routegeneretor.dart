import 'package:alpha_conecta/src/features/carteira_de_vendas/model/carteira_vendas_model.dart';
import 'package:alpha_conecta/src/features/carteira_de_vendas/view/carteira_detalhe.dart';
import 'package:alpha_conecta/src/features/carteira_de_vendas/view/carteira_filtro.dart';
import 'package:alpha_conecta/src/features/carteira_de_vendas/view/carteira_lista.dart';
import 'package:alpha_conecta/src/features/home/inicial_page.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  RouterGenerator();

  static Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const InicialPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const InicialPage());
      case '/CarteiraFiltro':
        return MaterialPageRoute(builder: (_) => const CarteiraFiltro());
      case '/CarteiraLista':
        return MaterialPageRoute(builder: (_) => const CarteiraLista());
      case '/CarteiraDetalhe':
        if (args is CarteiraVendasModel) {
          return MaterialPageRoute(builder: (_) => CarteiraDetalhe(item: args));
        } else {
          return MaterialPageRoute(builder: (_) => const InicialPage());
        }
      default:
        return MaterialPageRoute(builder: (_) => const InicialPage());
    }
  }
}
