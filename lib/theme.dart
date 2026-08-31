import 'package:flutter/material.dart';

const semilla = Color(0xFF3D5AFE);

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 61, 254)),

  appBarTheme: AppBarThemeData(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
  ),

  cardTheme: CardThemeData(
    elevation: 0,
    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
  ),

  chipTheme: ChipThemeData(
    showCheckmark: false,
    side: BorderSide.none,
  ),

  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 12),
  ),
);