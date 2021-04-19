import 'package:flutter/material.dart';

class K {
  static const mainColor = Color(0xFF060b1f);
  static const secondColor = Color(0xFFEBB52A);
  static const textColor=Colors.grey;
  static const whiteColor=Colors.white;
  static final textField = InputDecoration(
      filled: true,
      fillColor: Color(0xFF2F2F2F),
      labelText: "Search",
      labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: K.secondColor)
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),

      ));
}
