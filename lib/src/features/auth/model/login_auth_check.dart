import 'package:alpha_conecta/src/features/auth/controller/authservicelogin.dart';
import 'package:alpha_conecta/src/features/auth/view/loanding_page.dart';
import 'package:alpha_conecta/src/features/auth/view/login_page_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../main.dart';
import '../../../../routegeneretor.dart';

class LoginAuthCheck extends StatefulWidget {
  const LoginAuthCheck({super.key});

  @override
  State<LoginAuthCheck> createState() => _LoginAuthCheckState();
}

class _LoginAuthCheckState extends State<LoginAuthCheck> {
  _materialApp(lhome, mensagem) {
    return lhome
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatiorKey,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green.shade800,
              ),
            ),
            initialRoute: '/',
            onGenerateRoute: RouterGenerator.generateRoute,
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatiorKey,
            theme: ThemeData(
              fontFamily: 'Nasalisation-rg',
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green.shade800,
              ), // Cor de fundo
            ),
            home: LoginPageUser(msgError: mensagem),
          );
  }

  @override
  Widget build(BuildContext context) {
    AuthServiceLogin authService = Provider.of<AuthServiceLogin>(context);

    if (authService.isloading) {
      return const LoadingPage();
    } else if (authService.usuario == null) {
      return _materialApp(false, authService.msgError);
    } else {
      return _materialApp(true, authService.msgError);
    }
  }
}
