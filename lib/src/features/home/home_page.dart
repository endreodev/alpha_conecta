import 'package:alpha_conecta/routegeneretor.dart';
import 'package:flutter/material.dart';

// final navigatiorKey = GlobalKey<NavigatorState>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get navigatiorKey => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALPHA CONECTA',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatiorKey,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nasalisation-rg',
        brightness: Brightness.light, // dark, tema claro e dark é escuro
        primarySwatch: Colors.green, // Cor primaria barras bottoes onfocus
        backgroundColor: Colors.greenAccent, // Cor de fundo
      ),
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.generateRoute,
    );
  }
}
