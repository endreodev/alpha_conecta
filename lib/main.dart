import 'package:alpha_conecta/src/features/auth/controller/authservicelogin.dart';
import 'package:alpha_conecta/src/features/auth/model/login_auth_check.dart';
import 'package:alpha_conecta/src/features/carteira_de_vendas/controller/carteira_vendas_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final navigatiorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthServiceLogin()),
        ChangeNotifierProvider(create: (_) => CarteiraVendasService()),
      ],
      child: const LoginAuthCheck(),
    ),
  );
}
