import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app_colors.dart';

class MyThemeData{
  static final ThemeData LightTheme = ThemeData(
    primaryColor: AppColors.primayColor,
    scaffoldBackgroundColor: AppColors.backgroundLightColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primayColor,
      elevation: 0

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primayColor,
      unselectedItemColor: AppColors.graycolor,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      elevation: 0

    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15)
        ),

        side: BorderSide(
          color: AppColors.whiteColor,
          width: 4
        )
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primayColor,
      shape: StadiumBorder(
          side: BorderSide(
          color: AppColors.whiteColor,
          width: 5
      ))

    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor
      ),
      titleMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),
      bodyMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor
      ),
      bodySmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor
      ),

    )
  );
}
