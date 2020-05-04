import 'package:flutter/material.dart';

ThemeData basicTheme(){

  //metodo que sobreescribe el TextTheme por defecto
  TextTheme _basicTextTheme(TextTheme base){
      return base.copyWith(
        headline: base.headline.copyWith(
          fontFamily: 'Roboto',
          fontSize: 22.0,
          color: Colors.grey
        ),
        title: base.title.copyWith(
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        display1: base.display1.copyWith(
          fontFamily: 'Roboto',
          fontSize: 24.0,
          color: Colors.blueGrey
        ),
        display2: base.display2.copyWith(
          fontFamily: 'Lato',
          fontSize: 20.0,
          color: Colors.blueGrey
        ),
        caption: base.caption.copyWith(
          fontFamily: 'Roboto',
          color: Colors.white
        )
      );
  }

  final ThemeData base = ThemeData.light();
  //final Color colorPrimario = Color(0xFF0DA56D);
  //final Color colorPrimario = Color(0xFFFF9800);
  //final Color colorPrimario = Color(0xFF9A80A5);
  final Color colorPrimario = Color(0xFF5C3396);
 // final Color colorPrimario = Color(0xFFC72323);

  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    //primaryColor: Color(0xFFF5F5F5),
    primaryColor: colorPrimario,
    bottomAppBarColor: Colors.white,
    indicatorColor: Color(0xFF807A6B),
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    accentColor: Color(0xFFFFF8E1),
    iconTheme: IconThemeData(
        color: colorPrimario,
        size: 20.0,
      ),
    buttonColor: Colors.cyan,
    tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Colors.cyanAccent,
        unselectedLabelColor: Colors.grey,
      )
  );




}