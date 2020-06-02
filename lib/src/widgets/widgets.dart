//import 'dart:html';

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:tienda_virtual/src/models/producto_model.dart';


Widget getAppBarSearching(Function cancelSearch, Function searching){
      //TextEditingController searchController){
  return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            cancelSearch();
          }),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: TextField(
          controller: null,
          //controller: searchController,
          onEditingComplete: () {
            searching();
          },
          style: new TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          autofocus: true,
          decoration: InputDecoration(
            focusColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
}

Widget getAppBarNotSearching(BuildContext context, Function startSearchingFunction){
  return AppBar(
    title: Text('Tienda Virtual'),
    actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search,color: Theme.of(context).bottomAppBarColor,),
          onPressed: (){
            startSearchingFunction();
          }
           ),
      IconButton(
        icon: Icon(Icons.shopping_cart,color: Theme.of(context).bottomAppBarColor,),
        onPressed: (){}),
    ],
  );
}



Widget carouselBasico(double altura){
List<String> listImagenes = [
     'assets/images/carrousel/slider_1.jpg',
      'assets/images/carrousel/slider_2.jpg',
      'assets/images/carrousel/slider_3.jpg',
      'assets/images/carrousel/slider_4.jpg',
      'assets/images/carrousel/slider_5.jpg'
];

    return CarouselSlider(
      
      options: CarouselOptions(
            height: altura,
            //aspectRatio: 2.0,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,

      ),
      items: listImagenes.map(
        (item) => Container(
          height: altura,
          child: Center(
            child: Image.asset(item,
            fit: BoxFit.cover,width: 1000,height: altura,),
            
          ),
        )
        ).toList(),

      );

  
}


Widget cardProducto(Producto producto,BuildContext context){

  return Card(
    color: Theme.of(context).cardTheme.color,
    clipBehavior: Theme.of(context).cardTheme.clipBehavior,
    elevation: Theme.of(context).cardTheme.elevation,
    shadowColor: Theme.of(context).cardTheme.shadowColor,
    shape: Theme.of(context).cardTheme.shape,
    borderOnForeground: false,
    child: Hero(
       tag: producto.id,
      child: Material(
        child: InkWell(
          onTap: (){},
          child: GridTile(
              header: Container(
                    color: Colors.red.shade700,
                    child: Text('EN OFERTA',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
            child:FadeInImage(
              placeholder: AssetImage('assets/images/no_image.png'),
              image:  NetworkImage(producto.images[0].src),
              fit: BoxFit.fill,
              ),
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                      title: Text("${producto.name} \n Precio: \$ ${producto.salePrice}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10.0),),
                      subtitle: Text('Antes: \$ ${producto.regularPrice}',style: TextStyle(color: Colors.red,fontSize: 08.0, fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),),
                ),
              ),
            ),
        ),
      ),

      ),
  );



}

