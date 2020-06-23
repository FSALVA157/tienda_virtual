import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/models/producto_model.dart';
import 'package:tienda_virtual/src/widgets/widgets.dart';


class SliverGridProductos extends StatelessWidget {
 
 final int cantColumnas;
 final List<Producto> productos;
 //final Function siguientePagina;

 


 SliverGridProductos({@required this.productos,@required this.cantColumnas});
 //@required this.siguientePagina});

 //final _scrollController = new ScrollController();
  

  @override
  Widget build(BuildContext context) {
   

    // _scrollController.addListener(() { 
    //   if (_scrollController.offset >= _scrollController.position.maxScrollExtent) {
    //       print('pidiendo ofertas!!!!');
    //     siguientePagina();
    //     }
    // });
        
   
    int c = productos.length;
    print('en esta vuelta itemCount = $c');
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cantColumnas,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        ),
      delegate: SliverChildBuilderDelegate(
              (BuildContext context,int i){
                return  cardProducto(productos[i],context);
              },
              childCount: productos.length,
             ) , 
       );
    
        
  }
}