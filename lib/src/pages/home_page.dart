import 'package:flutter/material.dart';

import 'package:tienda_virtual/src/utils/body_home_page.dart';



class HomePage extends StatefulWidget {
  static final String ruta = 'home'; 
  
   
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  
  
  

  @override
  Widget build(BuildContext context) {
     
      final mq = MediaQuery.of(context);
      final _screenSize = mq.size;
      double _heightCarousel = _screenSize.height * 0.3;
    //  double _heightCategorias = _screenSize.height * 0.2;
     

     
      
      return Scaffold(
        // backgroundColor: Colors.white,
        //    drawer: BasicDrawer(),
        //   appBar: menuApp(),
            
        body: BodyHomePage(),
        
      );
    
  }

  

  

}