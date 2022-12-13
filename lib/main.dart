// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:alpha_conecta/controller/auth_service.dart';
import 'package:alpha_conecta/view/authcheck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
