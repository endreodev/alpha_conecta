import 'package:flutter/material.dart';

void showMyDialog({
  required String title,
  required String msg,
  required bool lsuccess,
  required BuildContext cnx,
}) {
  Widget oCloseButton = OutlinedButton(
    onPressed: () => Navigator.pop(cnx),
    child: const Text('Fechar'),
  );

  AlertDialog alerta = AlertDialog(
    icon: const Icon(Icons.error),
    title: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    content: Text(
      msg,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    actions: [
      oCloseButton,
      // okButton,
    ],
  );

  showDialog(
      context: cnx,
      builder: (BuildContext cnx) {
        return alerta;
      });
}
