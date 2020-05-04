import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/utils/basic_drawer.dart';
import 'package:tienda_virtual/src/utils/widgets.dart';

class HomePage extends StatefulWidget {
  static final String ruta = 'home'; 
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  
  

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
           drawer: BasicDrawer(),
          appBar: menuApp(),
          
    //        _isSearching? setState(() {
    //        getAppBarSearching(cancelSearch, searching);
    //       }): setState(() {
    //        getAppBarNotSearching(context, startSearching);
                
    // })
        
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

  AppBar menuApp(){
    
            if (_isSearching == true){
              return getAppBarSearching(cancelSearch, searching);
            }else{
              return getAppBarNotSearching(context, startSearching);
            }

            // setState(() {
              
            // });
          
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

  
}