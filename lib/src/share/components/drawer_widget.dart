// ignore_for_file: use_build_context_synchronously

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildHeader(
              name: "app" /*'authService.usuario!.name.toString()',*/,
              onClicked: () => {}),
          Container(
            height: MediaQuery.of(context).size.height - 250,
            // color: Colors.black,
            padding: padding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Carteira de Vendas',
                  icon: Icons.library_add_check,
                  onClicked: () => selectedItem(context, '/CarteiraFiltro'),
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Rotina 1',
                  icon: Icons.calculate_outlined,
                  onClicked: () => selectedItem(context, '/Simulacao'),
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Rotina 2',
                  icon: Icons.calculate_outlined,
                  onClicked: () => selectedItem(context, '/Simulacao'),
                ),
                const SizedBox(height: 10),
                buildMenuItem(
                  text: 'Rotina 3',
                  icon: Icons.calculate_outlined,
                  onClicked: () => selectedItem(context, '/Simulacao'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          SizedBox(
            height: 60,
            // color: Colors.red,
            child: buildMenuItem(
              text: 'Sair',
              icon: Icons.exit_to_app,
              onClicked: () => logoff(),
            ),
          )
        ],
      ),
    );
  }

  //função sair
  logoff() async {
    await context.read<AuthServiceLogin>().userlogoff();
    selectedItem(context, '/Simulacao');
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
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/images/logo.png'),
                      // child: const Icon(Icons.supervised_user_circle),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 80,
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 160,
                    height: 80,
                    // color: Colors.red,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                          ),
                          const Text(
                            'Agro Baggio - App',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ]),
                  )
                ],
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
    const color = Colors.white;
    const hoverColor = Colors.black;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).colorScheme.secondary,
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
