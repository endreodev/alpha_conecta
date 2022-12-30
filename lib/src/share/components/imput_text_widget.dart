import 'package:flutter/material.dart';

class ImputTextWidget extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  bool ispsw;
  bool obscureText;
  String? label;
  String? Function(String?)? validator;

  //
  ImputTextWidget({
    super.key,
    required this.controller,
    this.ispsw = true,
    this.obscureText = false,
    this.label,
    this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width - 30,
      child: TextFormField(
        controller: controller,
        obscureText: !obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFFDBE2E7),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          suffixIcon: ispsw
              ? InkWell(
                  onTap: () => setState(
                    () => obscureText = !obscureText,
                  ),
                  focusNode: FocusNode(skipTraversal: true),
                  child: Icon(
                    obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.black,
                    size: 22,
                  ),
                )
              : null,
        ),
        style: const TextStyle(
          fontFamily: 'Overpass',
          color: Color(0xFF2B343A),
        ),
      ),
    );
  }
}

setState(bool Function() param0) {
  setState(param0);
}
