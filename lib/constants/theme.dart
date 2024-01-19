

import 'package:basketlive/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    textTheme: lightTextTheme,
  );

  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: _headline1, //20px
    displayMedium: _headline2, //18px
    displaySmall: _headline3, //14px
   
  );


  static final TextStyle _headline3 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    fontSize: 14.sp,
  );

  static final TextStyle _headline2 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    fontSize: 18.sp,
  );

  static final TextStyle _headline1 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
    fontSize: 20.sp,
  );
}
