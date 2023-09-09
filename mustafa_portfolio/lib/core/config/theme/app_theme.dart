import 'package:flutter/cupertino.dart';
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
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          centerTitle: false,
          titleSpacing: 0,
          titleTextStyle: GoogleFonts.cairo(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
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
          fillColor: MaterialStateProperty.all(AppColors.primaryColor),
          overlayColor: MaterialStateProperty.all(AppColors.primaryColor),
          splashRadius: 24,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.blueColor,
          unselectedLabelColor: Colors.black38,
          labelPadding: EdgeInsets.symmetric(horizontal: designPaddingCenter),
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          enableFeedback: true,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
          unselectedIconTheme: const IconThemeData(color: Color(0xff94A3B8)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius),
            ),
            padding: EdgeInsets.symmetric(horizontal: designPadding),
            shadowColor: const Color(0xff6C5DD3),
            elevation: 0,
            foregroundColor: Colors.white,
            disabledForegroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xff94A3B8),
            backgroundColor: AppColors.blueColor,
          ),
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: AppColors.primaryColor,
          barBackgroundColor: AppColors.backgroundColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          textTheme: const CupertinoTextThemeData(
            navTitleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          applyThemeToAll: true,
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
              color: AppColors.redColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(designRadius),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          ),
          errorStyle: GoogleFonts.cairo(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.redColor,
          ),
          hintStyle: GoogleFonts.cairo(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(designRadius),
            ),
            side: const BorderSide(),
            padding: EdgeInsets.symmetric(horizontal: designPadding),
            foregroundColor: Colors.black,
          ),
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primaryColor,
          onPrimary: Colors.black,
          secondary: AppColors.secondaryColor,
          onSecondary: AppColors.secondaryColor,
          error: AppColors.redColor,
          onError: AppColors.backgroundColor,
          background: AppColors.backgroundColor,
          onBackground: Colors.black,
          surface: AppColors.backgroundColor,
          onSurface: Colors.black,
        ),
      );
}
