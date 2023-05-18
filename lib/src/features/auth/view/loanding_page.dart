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
      title: 'AGRO BAGGIO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nasalisation-rg',
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(background: Colors.greenAccent),
      ),
      home: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 34, 83, 46),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
