import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/pages/home_page.dart';
import 'package:tienda_virtual/src/utils/basic_theme.dart';
 
void main() => runApp(AppTienda());
 
class AppTienda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      title: 'Tienda',
      initialRoute: HomePage.ruta,
      routes: {
        HomePage.ruta : (BuildContext context) => HomePage(),
      },
      onUnknownRoute: (settings){
          return MaterialPageRoute(
            builder: (context) => HomePage(),
            );
      },
      
    );
  }
}