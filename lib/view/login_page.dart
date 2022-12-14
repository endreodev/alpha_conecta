import 'package:alpha_conecta/controller/auth_service.dart';
import 'package:alpha_conecta/validates/valide_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/imput_text_widget.dart';

class LoginPage extends StatefulWidget {
  String msgError;

  LoginPage({
    super.key,
    required this.msgError,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ValidFormFields oValform = ValidFormFields();

  TextEditingController? usuarioAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    usuarioAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;

    usuarioAddressController?.text = 'app';
    passwordController?.text = 'app';

    Future.delayed(Duration.zero, () {
      if (widget.msgError.isNotEmpty) {
        fwalert(cmsg: widget.msgError.toString(), ctx: context);
      }
    });
    // if (widget.msgError != null) {

    // }
  }

  @override
  void dispose() {
    usuarioAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  login() async {
    await context.read<AuthService>().login(
          usuarioAddressController!.text,
          passwordController!.text,
          context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 105, 160, 134),
        child: Center(
          child: Form(
            key: oValform.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ERP CONECTA',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 35),
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
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.all(18),
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (oValform.onValideForm(context)) {
                        FocusScope.of(context).requestFocus(FocusNode());

                        login();
                      } else {
                        //mostra popapi
                        oValform.fwalert(
                            context, 'Preencha todos os campos!', Colors.red);
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
        ),
      ),
    );
  }

  void fwalert({required String cmsg, required BuildContext ctx}) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(
          cmsg.toString().toUpperCase(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
