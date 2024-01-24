import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bookItem(String url, void Function() onClick){
  return Padding(
    padding: const EdgeInsets.only(right: 8.0, bottom: 5),
    child: InkWell(
      onTap: onClick,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Image.network(
              url,
            width: 100,
            height: 145,
            fit: BoxFit.cover
          ),
        ),
      ),
    ),
  );
}