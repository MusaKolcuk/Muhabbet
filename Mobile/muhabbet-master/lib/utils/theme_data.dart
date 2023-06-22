import 'package:flutter/material.dart';

import '../extension/buildMaterialColor.dart';

Color primaryColor = const Color(0xFF7fd8d4);
Color secondaryColor = const Color(0xFF7ddad3);
Color accentColor = const Color(0xFFE8F1FD);
ThemeData themeData = ThemeData(
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  
  popupMenuTheme: PopupMenuThemeData(
    textStyle: const TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    color: buildMaterialColor(
      const Color(0xFF4EBDD4),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: buildMaterialColor(
    const Color(0xFF4EBDD4),
  )),
  primaryIconTheme: const IconThemeData(color: Colors.black),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    filled: true,
    fillColor: Colors.grey[200],
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 2,
        //#8166D8 color
        color: Color(0xFFB0FBE6),
      ),
    ),
  ),
);
