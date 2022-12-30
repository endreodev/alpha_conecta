import 'package:flutter/material.dart';

class ButtonWidiget extends StatelessWidget {
  String title;
  double? altura;
  void Function()? onPressed;

  ButtonWidiget({
    super.key,
    required this.title,
    this.altura,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      height: altura ?? 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 71, 157, 103),
          elevation: 10,
        ),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
