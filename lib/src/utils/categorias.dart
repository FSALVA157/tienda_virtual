import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    final _tamanoPantalla = MediaQuery.of(context).size;
    double altura = _tamanoPantalla.height * 0.1; 

    // return Container(
    //       width: _tamanoPantalla.width,
    //       height: altura,
    //       child: 
        return  Column(
                children: <Widget>[
                  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Categorías',style: Theme.of(context).textTheme.subtitle,),
                        ),
                Container(
                   width: _tamanoPantalla.width,
                   height: altura,
                   child: ListView(
                     
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),
                            Icon(Icons.adb),

                          ],
                  ),
                )
              ],
    //       ),
   );
  }
}