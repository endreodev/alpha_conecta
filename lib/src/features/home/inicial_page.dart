import 'package:alpha_conecta/src/share/components/drawer_widget.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({super.key});

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Agro Baggio'),
        elevation: 30,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text('Rotina 1')),
            TextButton(onPressed: () {}, child: const Text('Rotina 2')),
            TextButton(onPressed: () {}, child: const Text('Rotina 3')),
            TextButton(onPressed: () {}, child: const Text('Rotina 4')),
            TextButton(onPressed: () {}, child: const Text('Rotina 5'))
          ],
        ),
      ),
      drawer: const NavigationDrawerWidget(),
    );
  }
}
