import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/pages/home_page.dart';

class BasicDrawer extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Fernando Javier Salva'),
            accountEmail: Text('xxavierargentino@hotmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor
            ),
            ),
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/drawer_fondo2.jpg'),
          //       fit: BoxFit.cover
          //       )
          //   ),
          //   child: Container(),
          //   ),
            ListTile(
              onTap: ()=>Navigator.pushReplacementNamed(context, HomePage.ruta),
              title: Text('Inicio',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.home,color: Colors.green,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Mi Cuenta',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.account_box,color: Colors.grey,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Mi Carrito',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.shop,color: Colors.blue,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Categorías',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.category,color: Colors.blue,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Favoritos',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.favorite,color: Colors.grey,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Configuración',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.settings,color: Colors.green,),
            ),
            ListTile(
              onTap: (){},
              title: Text('Quienes Somos',style: Theme.of(context).textTheme.display2,),
              leading: Icon(Icons.help,color: Colors.green,),
            ),
        ],
      ),
    );
  }
}