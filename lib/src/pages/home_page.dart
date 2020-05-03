import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/utils/basic_drawer.dart';
import 'package:tienda_virtual/src/utils/widgets.dart';

class HomePage extends StatefulWidget {
  static final String ruta = 'home'; 
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = true;
  

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
           drawer: BasicDrawer(),
          appBar: _isSearching? getAppBarSearching(cancelSearch, searching): getAppBarNotSearching(context, startSearching), 
          
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Primera Linea',style: Theme.of(context).textTheme.display1,),
            Icon(Icons.touch_app),
            FlatButton(
              onPressed: (){}, 
              child: Text('Boton de Prueba',style: Theme.of(context).textTheme.caption),
              color: Theme.of(context).primaryColor,
              
              )
          ],
        ),
    );
  }

  void startSearching(){
    setState(() {
      _isSearching = true;
    });
  }

  void cancelSearch(){}

  void searching(){}

  
}