import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  fontFamily: GoogleFonts.roboto().fontFamily,
  // match discord theme
  // primary #282b30
  // secondary #1e2124
  // tertiary #424549
  // accent #388e3c
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF282B30),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF424549),
    iconTheme: IconThemeData(color: Color(0xFF388E3C)),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF424549),
    selectedItemColor: Color(0xFF388E3C),
    unselectedItemColor: Colors.white30,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFF1E2124),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 18, color: Colors.white70),
    bodySmall: TextStyle(fontSize: 16, color: Colors.white60),
  ),
);
