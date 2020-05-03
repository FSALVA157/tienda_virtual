import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/pages/home_page.dart';

class BasicDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drawer_fondo2.jpg'),
                fit: BoxFit.cover
                )
            ),
            child: Container(),
            ),
            ListTile(
              onTap: ()=>Navigator.pushReplacementNamed(context, HomePage.ruta),
              title: Text('Home',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.home,color: Colors.green,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Sin Definir',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.home,color: Colors.grey,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Sin Definir',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.home,color: Colors.grey,),
            ),
        ],
      ),
    );
  }
}