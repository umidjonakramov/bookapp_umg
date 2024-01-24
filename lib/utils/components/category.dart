import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryItem(String text, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color.withOpacity(0.2)
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
      child: Text(
        text,

      ),
    ),
  );
}