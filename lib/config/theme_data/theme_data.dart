import 'dart:ui';
import 'package:flutter/material.dart';

class UI {
  FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

  static themeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF283C42),
        secondary: const Color(0xFF39555E),
        seedColor:const Color(0xFF72A8BE),
        brightness: Brightness.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF283C42)),
      )), // Here Im having the error
    );
  }

  titleTheme() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);
  }

  bodyTextTheme() {
    return const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
  }

  screenWidth() {
    Size size = view.physicalSize;
    return size.width;
  }

  screenHeight() {
    Size size = view.physicalSize;
    return size.height;
  }
}
