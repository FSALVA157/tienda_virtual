import 'package:flutter/material.dart';

ThemeData basicTheme(){

  //metodo que sobreescribe el TextTheme por defecto
  TextTheme _basicTextTheme(TextTheme base){
      return base.copyWith(
        headline1: base.headline1.copyWith(
          fontFamily: 'Roboto',
          fontSize: 22.0,
          color: Colors.grey
        ),
        subtitle1: base.subtitle1.copyWith(
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        
        subtitle2: base.subtitle2.copyWith(
          fontFamily: 'Roboto',
          fontSize: 20.0,
          color: Colors.blueGrey
        ),
        bodyText1: base.bodyText1.copyWith(
          fontFamily: 'Roboto',
          fontSize: 14.0,
          color: Colors.grey
        ),
        caption: base.caption.copyWith(
          fontSize: 10.0,
          fontFamily: 'Roboto',
          color: Colors.black
        ),
        bodyText2: base.bodyText2.copyWith(
          fontFamily: 'Lato',
          color: Colors.blueGrey,
          fontSize: 10.0,
          fontWeight: FontWeight.bold
        ),
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
      ),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        elevation: 5.0,
        shadowColor: Colors.blueGrey[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
     ),
  );




}