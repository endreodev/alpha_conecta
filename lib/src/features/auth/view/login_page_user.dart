import 'package:alpha_conecta/src/features/auth/controller/authservicelogin.dart';
import 'package:alpha_conecta/src/share/components/imput_text_widget.dart';
import 'package:alpha_conecta/src/validates/valide_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../main.dart';

class LoginPageUser extends StatefulWidget {
  String msgError;

  LoginPageUser({super.key, required this.msgError});

  @override
  State<LoginPageUser> createState() => _LoginPageUserState();
}

class _LoginPageUserState extends State<LoginPageUser> {
  //
  ValidFormFields oValform = ValidFormFields();

  TextEditingController? usuarioAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    usuarioAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;

    // usuarioAddressController?.text = 'app';
    // passwordController?.text = 'app';
  }

  @override
  void dispose() {
    usuarioAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  login() async {
    await context.read<AuthServiceLogin>().login(
          usuarioAddressController!.text,
          passwordController!.text,
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (widget.msgError.isNotEmpty) {
        ScaffoldMessenger.of(navigatiorKey.currentContext!)
            .showSnackBar(SnackBar(
          elevation: 50,
          backgroundColor: Colors.amber,
          content: Text(
            widget.msgError.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: oValform.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 60,
                width: 200,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const SizedBox(height: 25),
            ImputTextWidget(
              controller: usuarioAddressController,
              ispsw: false,
              obscureText: true,
              label: "Usuario",
              hint: "Usuario",
              validator: oValform.validateUsuario,
            ),
            const SizedBox(height: 15),
            ImputTextWidget(
              controller: passwordController,
              ispsw: true,
              obscureText: false,
              label: "Senha",
              hint: "Senha",
              validator: oValform.validateSenha,
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.all(18),
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (oValform.onValideForm(context)) {
                    login();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 71, 157, 103),
                  elevation: 10,
                ),
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  child: const Text(
                    'ACESSAR',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
