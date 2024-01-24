import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget InputEmail(TextEditingController controller) {
  return Container(
      child: Theme(
    data: ThemeData(
      primaryColor: Colors.redAccent,
      primaryColorDark: Colors.red,
    ),
    child: TextField(
      maxLength: 30,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counterText: "",
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFF2F2F2)),
        ),
        labelText: "Email Address",
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEB5757))),
      ),
    ),
  ));
}
Widget InputPass(TextEditingController controller, String label) {
  return Container(
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: TextField(
          maxLength: 30,
          controller: controller,
          // obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            counterText: "",
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFF2F2F2)),
            ),
            labelText: label,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFEB5757))),
          ),
        ),
      ));
}
