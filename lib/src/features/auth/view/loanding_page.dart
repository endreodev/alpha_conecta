import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALPHA CONECTA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nasalisation-rg',
        brightness: Brightness.light, // dark, tema claro e dark é escuro
        primarySwatch: Colors.green, // Cor primaria barras bottoes onfocus
        backgroundColor: Colors.greenAccent, // Cor de fundo
      ),
      home: Scaffold(
        body: Container(
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Carregando'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    // value: 0.30,
                    strokeWidth: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
