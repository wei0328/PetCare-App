import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';

class PetCareMythemes {
  static final lightTheme = ThemeData(
    primaryColor: PetCareColor.black,
    textTheme: const TextTheme(),
    fontFamily: 'RobotoRegular',
    brightness: Brightness.light,
    scaffoldBackgroundColor: PetCareColor.white,
    appBarTheme: AppBarTheme(
      iconTheme:  const IconThemeData(color: PetCareColor.black),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: fredokaregular.copyWith(
        color: PetCareColor.black,
        fontSize: 16,
      ),
      color: PetCareColor.transparent,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: PetCareColor.white,
    textTheme: const TextTheme(),
    fontFamily: 'RobotoRegular',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: PetCareColor.white),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: fredokaregular.copyWith(
        color: PetCareColor.white,
        fontSize: 16,
      ),
      color: PetCareColor.transparent,
    ),
  );
}