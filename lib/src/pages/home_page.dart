import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/utils/basic_drawer.dart';
import 'package:tienda_virtual/src/widgets/pageview_categorias.dart';
import 'package:tienda_virtual/src/widgets/widgets.dart';
import 'package:tienda_virtual/src/poviders/categorias_provider.dart';


class HomePage extends StatefulWidget {
  static final String ruta = 'home'; 
  
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  final categoriasProvider = new CategoriasProvider();
  

  @override
  Widget build(BuildContext context) {
      final mq = MediaQuery.of(context);
      final _screenSize = mq.size;
      double _heightCarousel = _screenSize.height * 0.3;
      double _heightCategorias = _screenSize.height * 0.2;
      categoriasProvider.getCategorias();
      
      return Scaffold(
           drawer: BasicDrawer(),
          appBar: menuApp(),
            
        body: OrientationBuilder(
          builder: (context,orientation){
              if(orientation == Orientation.portrait){
                  return ListView(
                    children: <Widget>[
                      //Slider
                      Container(
                        height: _heightCarousel,
                        child: carouselBasico(_heightCarousel),
                      ),
                      _menuCategorias(context),
                    ]
                      ); 
              }else{
                return ListView(
                    children: <Widget>[
                      //Slider
                        _menuCategorias(context),
                    ]
                      ); 
              }
          },
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

  Widget _menuCategorias(BuildContext context){
    final media = MediaQuery.of(context); 
    return Container(
        width: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Text('Categorías',style: Theme.of(context).textTheme.subtitle2,),
            ),
            FutureBuilder(
              future: categoriasProvider.getCategorias(),
              //initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  
                  return PageViewCategorias(categorias: snapshot.data,altura: media.size.height * 0.15);
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),

    );


  }

}