import 'package:flutter/material.dart';


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