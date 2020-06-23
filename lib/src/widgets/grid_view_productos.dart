import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/models/producto_model.dart';
import 'package:tienda_virtual/src/widgets/widgets.dart';


class GridViewProductos extends StatelessWidget {
 
 final int cantColumnas;
 final List<Producto> productos;
 final Function siguientePagina;

 


 GridViewProductos({@required this.productos,@required this.cantColumnas,@required this.siguientePagina});

 final _scrollController = new ScrollController();
  

  @override
  Widget build(BuildContext context) {
    //final _screenSize = MediaQuery.of(context).size;

    _scrollController.addListener(() { 
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
          print('pidiendo ofertas!!!!');
        siguientePagina();
        }
    });
        
    


    int c = productos.length;
    print('en esta vuelta itemCount = $c');
    return GridView.builder(
      controller: _scrollController,
      itemCount:  productos.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cantColumnas,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        ),

      itemBuilder: (BuildContext context,int i){
        return  cardProducto(productos[i],context);

        
      },
      scrollDirection: Axis.vertical,
      );
  }
}