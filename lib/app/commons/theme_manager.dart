import 'package:flutter/material.dart';

class ThemeManager {
  Color primaryColor = const Color.fromARGB(255, 35, 85, 201);
  Color secondaryColor = const Color.fromARGB(255, 116, 197, 255);
  Color tertiaryColor = const Color.fromARGB(255, 255, 116, 116);
  Color backgroundColor = const Color.fromARGB(255, 252, 252, 252);
  Color textColor = const Color.fromARGB(255, 29, 29, 29);
  Color accentColor = const Color.fromARGB(255, 68, 255, 243);
  Color hintColor = Colors.grey;
  Color errorColor = Colors.red;
  Color successColor = const Color.fromARGB(255, 113, 255, 118);
  Color warningColor = const Color.fromARGB(255, 255, 193, 100);
  Color shadowColor = Colors.grey[300]!;
  Color borderColor = Colors.grey[300]!;
  Color scaffoldBackgroundColor = Colors.white;
  Color appBarBackgroundColor = Colors.white;

  ThemeData get themeData {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        iconColor: primaryColor,
        textColor: textColor,
      ),
      fontFamily: 'Inter',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: textColor,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: textColor,
          fontSize: 12,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: textColor),
        errorStyle: TextStyle(color: errorColor),
        counterStyle: TextStyle(color: hintColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.white,
        constraints: const BoxConstraints(minHeight: 40),
        isDense: true,
        suffixIconColor: primaryColor,
        prefixIconColor: primaryColor,
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          minimumSize: MaterialStateProperty.all(const Size(10, 10)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              //   side: BorderSide(color: , width: 1),
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            primaryColor,
          ),
          elevation: MaterialStateProperty.all(0),
          fixedSize: MaterialStateProperty.all(
            const Size(double.infinity, 40),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: primaryColor, width: 0),
            ),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: accentColor),
    );
  }
}
