import 'package:alpha_conecta/src/features/auth/controller/authservicelogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    AuthServiceLogin authService = Provider.of<AuthServiceLogin>(context);

    return Drawer(
      child: Material(
        // color: Colors.greenAccent[200], //const Color.fromRGBO(0, 170, 70, 70),
        color: Theme.of(context).secondaryHeaderColor, //Colors.lightGreen[200],
        child: ListView(
          children: <Widget>[
            buildHeader(
                name: authService.usuario!.name.toString(),
                onClicked: () => {}),
            Container(
              // color: Colors.black,
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Carteira de Vendas',
                    icon: Icons.library_add_check,
                    onClicked: () => selectedItem(context, '/CarteiraFiltro'),
                  ),
                  // const SizedBox(height: 16),
                  // buildMenuItem(
                  //   text: 'Simulação',
                  //   icon: Icons.calculate_outlined,
                  //   onClicked: () => selectedItem(context, '/Simulacao'),
                  // ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Sair',
                    icon: Icons.exit_to_app,
                    onClicked: () => logoff(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //função sair
  logoff() async {
    await context.read<AuthServiceLogin>().userlogoff();
  }

  Widget buildHeader({
    required String name,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: (40),
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        // child: Image.asset('assets/imagens/logo.png'),
                        child: const Icon(Icons.supervised_user_circle),
                      )),
                  const SizedBox(width: 20),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 400,
                child: Text(
                  'Usuario',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.black;
    const hoverColor = Colors.white70;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).primaryColorLight,
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(text, style: const TextStyle(color: color)),
        hoverColor: hoverColor,
        onTap: onClicked,
      ),
    );
  }

  void selectedItem(BuildContext context, String index) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(index);
  }
}
