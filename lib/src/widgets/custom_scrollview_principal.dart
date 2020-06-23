import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/providers/categorias_provider.dart';
import 'package:tienda_virtual/src/providers/productos_provider.dart';
import 'package:tienda_virtual/src/widgets/grid_view_productos.dart';
import 'package:tienda_virtual/src/widgets/pageview_categorias.dart';
import 'package:tienda_virtual/src/widgets/sliver_custom_header.dart';
import 'package:tienda_virtual/src/widgets/widgets.dart';

import 'app_bar_principal.dart';

class CustomScrollViewPrincipal extends StatefulWidget {
  final int cantColumnas;
  final bool slideVisible;
  
  CustomScrollViewPrincipal({@required this.cantColumnas,@required this.slideVisible});

  @override
  _CustomScrollViewPrincipalState createState() => _CustomScrollViewPrincipalState();
}

class _CustomScrollViewPrincipalState extends State<CustomScrollViewPrincipal> {
  final categoriasProvider = new CategoriasProvider();
  final productosProvider = new ProductosProvider();
  final _scrollController = new ScrollController();
  

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final _screenSize = mq.size;
    double _alturaCarrousel = _screenSize.height * 0.3;
    double _alturaCategorias = _screenSize.height * 0.15;
    categoriasProvider.getCategorias();
    productosProvider.getOfertas();

    _scrollController.addListener(() { 
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
          print('pidiendo ofertas!!!!');
        //siguientePagina();
        }
    });


    return OrientationBuilder(
          builder:(context,orientation){
          return StreamBuilder(
        stream: productosProvider.productsStream,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
           if(snapshot.hasData){
             return
             CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              title: SizedBox(
                child: AppBarPrincipal()
              ),
            ),
            (this.widget.slideVisible) ? SliverPersistentHeader(
              delegate: SliverCustomHeader(minHeight: _alturaCarrousel - 10, maxHeight: _alturaCarrousel, child: carouselBasico(_alturaCarrousel))
              ) : SliverPersistentHeader(
              delegate: SliverCustomHeader(minHeight: 0, maxHeight: 0, child: Container())),
              SliverPersistentHeader(
              floating: true,
              delegate: SliverCustomHeader(
                minHeight: _alturaCategorias - 1, 
                maxHeight:  (orientation == Orientation.portrait)?_alturaCategorias : _alturaCategorias + 5, 
                child: SizedBox.expand(
                  child: (orientation == Orientation.portrait)?_menuCategorias(context,_alturaCategorias) : _menuCategorias(context,_alturaCategorias + 5)
                  )
                  )
              ),
              
              SliverGrid(
                  gridDelegate: 
                    (orientation == Orientation.portrait)?
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ):SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                              return cardProducto(snapshot.data[index],context);
                            }, 
                            childCount: snapshot.data.length,
                    )
                    
              )
             
          ],
        );
           }
        else{
              return Center(
                      child: CircularProgressIndicator(),
                                       );
        }
        }
      );
          }
    );
  }

  @override
  void dispose() { 
    super.dispose();
    categoriasProvider.disposeStreams();
    productosProvider.disposeStreams();
   
  }

 
Widget gridOfertas(BuildContext context,Orientation orientation){
    return 
        Container(
                         padding: EdgeInsets.symmetric(horizontal: 10.0),
                         width: double.infinity,
                         height: MediaQuery.of(context).size.height * 0.65,
                          child: StreamBuilder(
                            stream: productosProvider.productsStream,
                            //initialData: initialData ,
                            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
                              if(snapshot.hasData){
                                  return  
                                  orientation == Orientation.portrait?GridViewProductos(
                                    productos: snapshot.data, 
                                    cantColumnas: 2,
                                    siguientePagina: productosProvider.getOfertas
                                    ):GridViewProductos(
                                    productos: snapshot.data,
                                    cantColumnas: 3,
                                    siguientePagina: productosProvider.getOfertas,
                                    );
                              }else{
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                     
                       )
    ;
  }


Widget _menuCategorias(BuildContext context,double alturaBarra){
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
                 return media.orientation == Orientation.portrait? PageViewCategorias(categorias: snapshot.data,
                 altura: alturaBarra-1,
                 //altura: media.size.height * 0.15,
                 siguientePagina: categoriasProvider.getCategorias) : PageViewCategorias(
                   categorias: snapshot.data,
                   altura: alturaBarra-1,
                   //altura: media.size.height * 0.25,
                   siguientePagina: categoriasProvider.getCategorias);
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