import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mustafa_portfolio/core/config/theme/app_colors.dart';
import 'package:mustafa_portfolio/core/config/theme/sizes.dart';

/// this class is used to set the app theme data and colors for the app
class AppTheme {
  /// this method is used to get the app theme data
  static ThemeData get appTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        brightness: Brightness.light,
        useMaterial3: false,
        fontFamily: 'satoshi',
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.backgroundColor,
          foregroundColor: AppColors.primaryColor,
          elevation: 4,
          splashColor: AppColors.primaryColor,
          hoverColor: AppColors.primaryColor,
          focusColor: AppColors.primaryColor,
          hoverElevation: 4,
          focusElevation: 4,
          iconSize: 36,
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.all(AppColors.primaryColor),
          overlayColor: WidgetStateProperty.all(AppColors.primaryColor),
          splashRadius: 24,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius),
            ),
            minimumSize: Size(0, 50),
            padding: EdgeInsets.symmetric(
              horizontal: designPaddingBetween,
            ),
            elevation: 0,
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xff94A3B8),
            backgroundColor: AppColors.primaryColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius),
            ),
            minimumSize: Size(0, 50),
            padding: EdgeInsets.symmetric(
              horizontal: designPaddingCenter,
            ),
            side: const BorderSide(),
            foregroundColor: AppColors.primaryColor,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            minimumSize: Size(0, 50),
            padding: EdgeInsets.symmetric(
              horizontal: designPaddingCenter,
            ),
            foregroundColor: AppColors.primaryColor,
            shape: StadiumBorder(),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.all(14),
          helperMaxLines: 6,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(designRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(designRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(designRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(designRadius),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(designRadius),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          errorStyle: GoogleFonts.cairo(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.red,
          ),
          hintStyle: GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryColor,
          onPrimary: AppColors.textPrimaryColor,
          secondary: AppColors.secondaryColor,
          onSecondary: AppColors.textPrimaryColor,
          error: Colors.red,
          onError: AppColors.backgroundColor,
          surface: AppColors.backgroundColor,
          onSurface: Colors.black,
        ),
      );
}
