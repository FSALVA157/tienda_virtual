import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';


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