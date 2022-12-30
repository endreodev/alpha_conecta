import 'package:alpha_conecta/src/features/auth/controller/authservicelogin.dart';
import 'package:alpha_conecta/src/features/auth/view/loanding_page.dart';
import 'package:alpha_conecta/src/features/auth/view/login_page_user.dart';
import 'package:alpha_conecta/src/features/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../routegeneretor.dart';

final navigatiorKey = GlobalKey<NavigatorState>();

class LoginAuthCheck extends StatefulWidget {
  const LoginAuthCheck({super.key});

  @override
  State<LoginAuthCheck> createState() => _LoginAuthCheckState();
}

class _LoginAuthCheckState extends State<LoginAuthCheck> {
  _materialApp(lhome, mensagem) {
    return !lhome
        ? MaterialApp(
            title: 'ALPHA CONECTA',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatiorKey,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Nasalisation-rg',
              brightness: Brightness.light, // dark, tema claro e dark é escuro
              primarySwatch:
                  Colors.green, // Cor primaria barras bottoes onfocus
              backgroundColor: Colors.greenAccent, // Cor de fundo
            ),
            home: LoginPageUser(msgError: mensagem),
          )
        : MaterialApp(
            title: 'ALPHA CONECTA',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatiorKey,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Nasalisation-rg',
              brightness: Brightness.light, // dark, tema claro e dark é escuro
              primarySwatch:
                  Colors.green, // Cor primaria barras bottoes onfocus
              backgroundColor: Colors.greenAccent, // Cor de fundo
            ),
            initialRoute: '/',
            onGenerateRoute: RouterGenerator.generateRoute,
          );
  }

  @override
  Widget build(BuildContext context) {
    AuthServiceLogin authService = Provider.of<AuthServiceLogin>(context);

    print(authService.isloading);

    if (authService.isloading) {
      return const LoadingPage();
    } else if (authService.usuario == null) {
      return _materialApp(false, authService.msgError);
    } else {
      return _materialApp(true, authService.msgError);
    }
  }
}
