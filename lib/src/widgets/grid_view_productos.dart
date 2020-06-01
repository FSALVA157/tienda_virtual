import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/models/producto_model.dart';



class GridViewProductos extends StatelessWidget {
 
 final int cantColumnas;
 final List<Producto> productos;
 
 GridViewProductos({@required this.productos,@required this.cantColumnas});
  
  @override
  Widget build(BuildContext context) {
    
    return GridView.builder(
      itemCount:  productos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cantColumnas,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        ),

      itemBuilder: (BuildContext context,int i){
        return Card(
          color: Colors.grey,
          child: Text(productos[i].name),

        );
      },
      scrollDirection: Axis.vertical,
      );
  }
}