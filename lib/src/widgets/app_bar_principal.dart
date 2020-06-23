import 'package:flutter/material.dart';

class AppBarPrincipal extends StatefulWidget {
 

  @override
  _AppBarPrincipalState createState() => _AppBarPrincipalState();
}

class _AppBarPrincipalState extends State<AppBarPrincipal> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
      if (_isSearching == true){
              return getAppBarSearching(cancelSearch, searching);
            }else{
              return getAppBarNotSearching(context, startSearching);
            }
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
}

