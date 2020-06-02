import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/providers/productos_provider.dart';
import 'package:tienda_virtual/src/utils/basic_drawer.dart';
import 'package:tienda_virtual/src/widgets/grid_view_productos.dart';
import 'package:tienda_virtual/src/widgets/pageview_categorias.dart';
import 'package:tienda_virtual/src/widgets/widgets.dart';
import 'package:tienda_virtual/src/providers/categorias_provider.dart';


class HomePage extends StatefulWidget {
  static final String ruta = 'home'; 
  
   
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  final categoriasProvider = new CategoriasProvider();
  final productosProvider = new ProductosProvider();
  

  @override
  Widget build(BuildContext context) {
      productosProvider.getOfertas();
      final mq = MediaQuery.of(context);
      final _screenSize = mq.size;
      double _heightCarousel = _screenSize.height * 0.3;
    //  double _heightCategorias = _screenSize.height * 0.2;
     categoriasProvider.getCategorias();

     
      
      return Scaffold(
        backgroundColor: Colors.white,
           drawer: BasicDrawer(),
          appBar: menuApp(),
            
        body: OrientationBuilder(
          builder: (context,orientation){
                 return ListView(
                    children: <Widget>[
                      //Slider
                      orientation == Orientation.portrait?Container(
                        height: _heightCarousel,
                        child: carouselBasico(_heightCarousel),
                      ):Container(),
                      //menu de categorias
                     _menuCategorias(context),     
                       Container(
                         padding: EdgeInsets.symmetric(horizontal: 10.0),
                         width: double.infinity,
                         height: _screenSize.height * 0.65,
                          child: StreamBuilder(
                            stream: productosProvider.productsStream,
                            //initialData: initialData ,
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                              if(snapshot.hasData){
                                  return  
                                  orientation == Orientation.portrait?GridViewProductos(productos: snapshot.data, cantColumnas: 2,):GridViewProductos(productos: snapshot.data, cantColumnas: 3,);
                              }else{
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                     
                       )
                    ]
                      );     


          },
        ),
      );
    
  }

  @override
  void dispose() { 
    categoriasProvider.disposeStreams();
    productosProvider.disposeStreams();
    super.dispose();
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
   // productosProvider.getOfertas();
    return Container(
        width: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Container(
            //   padding: EdgeInsets.only(left: 20.0),
            //   child: Text('Categorías',style: Theme.of(context).textTheme.subtitle2,),
            // ),
            StreamBuilder(
              stream: categoriasProvider.categoriasStream,
              //initialData: InitialData,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                 return media.orientation == Orientation.portrait? PageViewCategorias(categorias: snapshot.data,altura: media.size.height * 0.15,siguientePagina: categoriasProvider.getCategorias) : PageViewCategorias(categorias: snapshot.data,altura: media.size.height * 0.25,siguientePagina: categoriasProvider.getCategorias);
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