import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  static final textStyle24Bold = GoogleFonts.roboto(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
  );
  static final textStyle20SemiBold = GoogleFonts.roboto(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );
  static final textStyle14Regular = GoogleFonts.roboto(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static final textStyle24BoldWhite = GoogleFonts.roboto(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );
  static final textStyle14RegularWhite = GoogleFonts.roboto(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.white
  );
}
