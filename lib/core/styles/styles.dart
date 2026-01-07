import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTextStyles {

  static final TextStyle raleWay48 = GoogleFonts.raleway(
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.greyDark,
  );



  // ElMessIri
  static final TextStyle elMessIri40= GoogleFonts.elMessiri(
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.black,
  );

  static final TextStyle elMessIri30 = GoogleFonts.elMessiri(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: MyColors.bluePrimary,
  );

  static final TextStyle elMessIri20 = GoogleFonts.elMessiri(
    fontSize: 20.sp,
    color: MyColors.greyDark,
    fontWeight: FontWeight.bold
  );

  static final TextStyle elMessIri18 = GoogleFonts.elMessiri(
    fontSize: 18.sp,
    color: MyColors.greyDark,
  );

  static final TextStyle elMessIri16 = GoogleFonts.elMessiri(
      fontSize: 16.sp,
      color: MyColors.red,
      fontWeight: FontWeight.bold
  );

  // NuNiToSans

  static final TextStyle nuNiToSans15 = GoogleFonts.nunitoSans(
    fontSize: 15.sp,
    color: MyColors.greyDark,
  );

  static final TextStyle nuNiToSans19 = GoogleFonts.nunitoSans(
    fontSize: 19.sp,
    fontWeight: FontWeight.normal,
    color: MyColors.greyDark,
  );

  static final TextStyle nuNiToSans22 = GoogleFonts.nunitoSans(
    fontSize: 22.sp,
    color: MyColors.greyLighter,
  );

  static final TextStyle bodyText2 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: MyColors.greyLighter,
  );

  // Buttons
  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Caption / small text
  static final TextStyle caption = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.grey[600],
  );


  static TextTheme textTheme = TextTheme(
    displayLarge: raleWay48,
    displayMedium: nuNiToSans19,
    displaySmall: nuNiToSans15,
    bodyLarge: nuNiToSans22,
    bodyMedium: bodyText2,
    labelLarge: button,
    bodySmall: caption,
  );


  static TextStyle textStyle24 = TextStyle(
    color: MyColors.white,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle18 = TextStyle(
    color: MyColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle textStyle14 = TextStyle(
    color: MyColors.white,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle textStyle20 = TextStyle(
      color: MyColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300);
  static TextStyle textStyle13 = TextStyle(
    color: MyColors.white,
    fontSize: 13.sp,
  );
}
