import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/utils/basic_drawer.dart';
import 'package:tienda_virtual/src/widgets/listview_categorias.dart';
import 'package:tienda_virtual/src/widgets/widgets.dart';



class HomePage extends StatefulWidget {
  static final String ruta = 'home'; 
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  
  

  @override
  Widget build(BuildContext context) {
      final _screenSize = MediaQuery.of(context).size;
      double _heightCarousel = _screenSize.height * 0.3;
      double _heightCategorias = _screenSize.height * 0.2;
      return Scaffold(
           drawer: BasicDrawer(),
          appBar: menuApp(),
            
        body: ListView(
          children: <Widget>[
            //Slider
            Container(
              height: _heightCarousel,
              child: carouselBasico(_heightCarousel),
            ),
             Categorias(),
            
          
    




          ],
        ),
    );
  }

  AppBar menuApp(){
    
            if (_isSearching == true){
              return getAppBarSearching(cancelSearch, searching);
            }else{
              return getAppBarNotSearching(context, startSearching);
            }

            // setState(() {
              
            // });
          
  }

  void startSearching(){
    setState(() {
      _isSearching = true;
    });
  }

  void cancelSearch(){
    setState(() {
      _isSearching = false;
    });
  }

  void searching(){}

  
}