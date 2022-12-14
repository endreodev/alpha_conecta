import 'package:alpha_conecta/controller/auth_service.dart';
import 'package:alpha_conecta/view/home_page.dart';
import 'package:alpha_conecta/view/loanding_page.dart';
import 'package:alpha_conecta/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isloading) {
      return const LoadingPage();
    } else if (auth.usuario == null) {
      if (auth.msgError.isNotEmpty) {
        return LoginPage(msgError: auth.msgError);
      } else {
        return LoginPage(msgError: '');
      }
    } else {
      return const HomePage();
    }
  }
}
