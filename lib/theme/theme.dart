// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppTheme {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }

  static const Color _lightFocusColor = Colors.black;
  static const Color _darkFocusColor = Colors.green;

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle({
    int fontWeight = 500,
    bool muted = false,
    bool xMuted = false,
    double letterSpacing = 0.0,
    Color? color,
    TextDecoration decoration = TextDecoration.none,
    double? height,
    double wordSpacing = 0,
    double? fontSize,
    double? decorationThickness,
    Color? decorationColor,
    FontStyle? fontStyle,
    String? fontFamily,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: _getFontWeight(fontWeight),
      fontStyle: fontStyle,
      fontFamily: fontFamily ?? "SF-Pro-Regular",
      letterSpacing: letterSpacing,
      color: color,
      decoration: decoration,
      height: height,
      wordSpacing: wordSpacing,
    );
  }

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
            color: colorScheme.background,
            actionsIconTheme: IconThemeData(color: colorScheme.onBackground),
            iconTheme: IconThemeData(color: colorScheme.onBackground),
            toolbarHeight: AppBar().preferredSize.height,
            elevation: 0),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          },
        ),
        inputDecorationTheme: const InputDecorationTheme(),
        iconTheme: IconThemeData(color: colorScheme.onSecondary),
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: Colors.white,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        backgroundColor: colorScheme.background,
        bottomAppBarColor: Colors.transparent,
        bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.transparent),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent));
  }

  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
      seedColor: _lightFocusColor,
      primary: const Color(0XFFFFC257), //  PRIMARY_COLOR
      onPrimary: const Color(0XFFF3D733), //PRIMARY_DARK_COLOR
      onPrimaryContainer: const Color(0XFFFFBB00), //TRICERY_COLOR
      primaryContainer: const Color(0XFFFFAF47), //ACCENT_COLOR
      // primaryVariant: Color(0XFFF8B823), //Get Button Aishwariyum
      secondary: Colors.grey, //SEC_TEXT_COLOR
      onSecondary: const Color(0XFF333232), //SECONDARY_COLOR
      onSecondaryContainer: const Color(0XFF393939), //BUTTON_COLOR_01
      background: const Color(0XFFF5F5F5), //BACKGROUND_COLOR
      onBackground: const Color(0XFFFDF7D6), //PRIMARY_LIGHT_COLOR
      surface: const Color(0XFFFFFFFF), //WHITE_COLOR
      onSurface: const Color(0XFFFFE4C1), //SAND_BOX_COLOR
      surfaceTint: const Color(0XFFFFF7CF), //SAND_BOX_COLOR2
      onTertiary: const Color(0XFF000000), //BLACK_COLOR
      onTertiaryContainer: const Color(0XFF10AC34), //BUTTON_COLOR_02
      inversePrimary: const Color(0XFF70C133), //Cart Green
      inverseSurface: const Color(0XFF4AC71E), //Get Button
      onSurfaceVariant: const Color(0XFF2D4754), //Fruit Expand
      surfaceVariant: const Color(0XFFFFCD5A), //fruit card color
      onInverseSurface: const Color.fromARGB(255, 35, 61, 15),
      error: Colors.red,
      onErrorContainer: const Color(0XFF620800), //Scheme Text
      errorContainer:
          const Color(0XFFA42B2B), //Akshayam Scheme Button/Card Color
      onError: Colors.white,
      brightness: Brightness.light,
      secondaryContainer: const Color.fromARGB(255, 97, 97, 97) //Bottom_COLOR
      );

  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: _darkFocusColor,
    primary: const Color(0XFFFFC257),
    onPrimary: const Color(0XFFF3D733),
    onPrimaryContainer: const Color(0XFFFFBB00),
    primaryContainer: const Color(0XFFFFAF47),
    secondary: const Color(0xFFec9410),
    onSecondary: const Color(0xff9999aa),
    onSecondaryContainer: const Color(0xff9999aa),
    background: const Color(0xff151515),
    onBackground: const Color(0x0DFFFFFF),
    surface: const Color(0xff1E2746),
    onSurface: Colors.white,
    error: Colors.red,
    errorContainer: Colors.red,
    onError: Colors.white,
    brightness: Brightness.dark,
  );
}
