import 'package:alpha_conecta/controller/auth_service.dart';
import 'package:alpha_conecta/view/authcheck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// final navigatiorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MaterialApp(
        home: AuthCheck(),
      ),
    ),
  );
}
