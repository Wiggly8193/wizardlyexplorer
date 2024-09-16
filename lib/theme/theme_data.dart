import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);

// color: const Color.fromRGBO(88, 100, 101, 1),
// color: const Color.fromRGBO(113, 144, 162, 1),
// color: const Color.fromRGBO(204, 192, 161, 1),
// color: const Color.fromRGBO(225, 219, 189, 1),

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 2,
    iconTheme: const IconThemeData(
      color: Color.fromRGBO(88, 100, 101, 1),
    ),
    titleTextStyle: GoogleFonts.cinzel(
      color: const Color.fromRGBO(88, 100, 101, 1),
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: GoogleFonts.cinzelTextTheme().copyWith(
    titleMedium: GoogleFonts.cinzel(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: GoogleFonts.cinzel(
      fontSize: 28.sp,
      fontWeight: FontWeight.w900,
      backgroundColor: const Color.fromRGBO(176, 174, 171, 1.0),
      color: const Color.fromRGBO(144, 134, 104, 1),
    ),
    bodySmall: GoogleFonts.cinzel(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
  ),
);
