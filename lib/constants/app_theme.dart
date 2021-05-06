import 'package:flutter/material.dart';

final _appFont = TextStyle(fontFamily: 'Rubik');

final appTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  accentColor: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.blueGrey[900],
  backgroundColor: Colors.grey,
  cardColor: Colors.blueGrey[800],
  primaryTextTheme: TextTheme(
    headline6: _appFont,
  ),
  textTheme: TextTheme(
    subtitle1: _appFont.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
    bodyText1: _appFont.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      fontSize: 14,
    ),
    bodyText2: _appFont.copyWith(
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w100,
      fontSize: 12,
    ),
  ),
);