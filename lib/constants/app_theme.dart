import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final baseTextTheme =
        brightness == Brightness.dark
            ? Typography.whiteMountainView
            : Typography.blackMountainView;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: brightness,
      error: error,
    );

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      canvasColor: background,
      primaryColor: accentColor,
      cardColor: cardBackground ?? background,
      dividerColor: divider,

      fontFamily: 'Poppins',
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
        ),
        color: background,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryText, size: 24.sp),
        toolbarTextStyle: TextStyle(
          color: secondaryText ?? primaryText,
          fontSize: 18.sp,
        ),
      ),
      iconTheme: IconThemeData(color: primaryText, size: 24.sp),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: primaryText.withOpacity(0.5),
        ),
        errorStyle: TextStyle(color: error),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.selected)
                  ? accentColor
                  : Colors.grey,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.selected)
                  ? accentColor
                  : Colors.grey,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith(
          (states) =>
              states.contains(MaterialState.selected)
                  ? accentColor
                  : Colors.grey,
        ),
      ),
      textTheme: GoogleFonts.interTextTheme(baseTextTheme).copyWith(
        displayLarge: GoogleFonts.inter(
          textStyle: baseTextTheme.displayLarge,
          fontSize: 26.sp,
          fontWeight: FontWeight.w700,
          color: primaryText,
        ),
        displayMedium: GoogleFonts.inter(
          textStyle: baseTextTheme.displayMedium,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        bodyLarge: GoogleFonts.inter(
          textStyle: baseTextTheme.bodyLarge,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        bodyMedium: GoogleFonts.inter(
          textStyle: baseTextTheme.bodyMedium,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        labelLarge: GoogleFonts.inter(
          textStyle: baseTextTheme.labelLarge,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: primaryText,
        ),
        bodySmall: GoogleFonts.inter(
          textStyle: baseTextTheme.bodySmall,
          fontSize: 11.sp,
          fontWeight: FontWeight.w300,
          color: primaryText,
        ),
        labelSmall: GoogleFonts.inter(
          textStyle: baseTextTheme.labelSmall,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: secondaryText,
        ),
        titleMedium: GoogleFonts.inter(
          textStyle: baseTextTheme.titleMedium,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: primaryText,
        ),
        titleSmall: GoogleFonts.inter(
          textStyle: baseTextTheme.titleSmall,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: secondaryText,
        ),
      ),
    );
  }

  /// LIGHT THEME
  static ThemeData get lightTheme => createTheme(
    brightness: Brightness.light,
    background: AppColors.whiteColor,
    cardBackground: AppColors.whiteColor,
    primaryText: AppColors.textBlackColor,
    secondaryText: AppColors.textColor,
    accentColor: AppColors.primaryColor,
    divider: Colors.grey.shade300,
    buttonBackground: AppColors.primaryColor,
    buttonText: AppColors.whiteColor,
    disabled: Colors.grey.shade400,
    error: AppColors.redColor,
  );

  /// DARK THEME
  static ThemeData get darkTheme => createTheme(
    brightness: Brightness.dark,
    background: AppColors.backgroundColor,
    cardBackground: AppColors.backgroundColor,
    primaryText: AppColors.whiteColor,
    secondaryText: AppColors.textColor,
    accentColor: AppColors.primaryColor,
    divider: Colors.black26,
    buttonBackground: AppColors.whiteColor,
    buttonText: AppColors.textBlackColor,
    disabled: Colors.grey,
    error: AppColors.redColor,
  );
}
