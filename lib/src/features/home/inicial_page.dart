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
        title: Text('ALPHA CONECTA'),
        elevation: 30,
      ),
      body: Container(
        child: Text('inicial'),
      ),
      drawer: const NavigationDrawerWidget(),
    );
  }
}
