import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/providers/productos_provider.dart';


class GridViewProductos extends StatelessWidget {
 int cantColumnas;
 final productosProvider = new ProductosProvider();

 GridViewProductos({@required this.cantColumnas});
  
  final List<String> listaDatos = ['tarjeta 1','tarjeta 2','tarjeta 3','tarjeta 4','tarjeta 5','tarjeta 6','tarjeta 7','tarjeta 8','tarjeta 9','tarjeta 10','tarjeta 11','tarjeta 12','tarjeta 13','tarjeta 14','tarjeta 15','tarjeta 16','tarjeta 17','tarjeta 18','tarjeta 19','tarjeta 20',];

  @override
  Widget build(BuildContext context) {
     productosProvider.getOfertas();
    return GridView.builder(
      itemCount: listaDatos.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cantColumnas,
        crossAxisSpacing: 3.0,
        mainAxisSpacing: 3.0,
        ),

      itemBuilder: (BuildContext context,int i){
        return Card(
          color: Colors.blueGrey,
          child: Text(listaDatos[i]),

        );
      },
      scrollDirection: Axis.vertical,
      );
  }
}