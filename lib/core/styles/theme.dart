import 'package:e/core/styles/styles.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme{
  static ThemeData themeData =ThemeData(
    scaffoldBackgroundColor: MyColors.white,
    textTheme: AppTextStyles.textTheme,

  appBarTheme: AppBarTheme(
    backgroundColor: MyColors.white,
    elevation:0,
    scrolledUnderElevation: 0,
  )

  );
}