import 'package:flutter/material.dart';

class Auth_text_field extends StatelessWidget {
  final String text;
  final String icon;
  bool isPassword;
  TextEditingController controller;
  String? Function(String?)? validator;
  TextInputType type;
  bool isObscure = false;

  Auth_text_field({
    required this.text,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextFormField(
          textAlign: TextAlign.start,
          controller: controller,
          validator: validator,
          keyboardType: type,
          obscureText: isPassword,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              focusColor: Colors.black26,
              fillColor: Color.fromARGB(255, 247, 247, 247),
              filled: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  child: Image.asset(icon),
                ),
              ),
              prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
              label: Text(text),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30),
              )),
        ),
      ),
    );
  }
}
