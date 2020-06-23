import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/widgets/custom_scrollview_principal.dart';

class BodyHomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context,orientation){
        if(orientation == Orientation.portrait){
        return CustomScrollViewPrincipal(cantColumnas: 2,slideVisible: true);
        }else{
          return CustomScrollViewPrincipal(cantColumnas: 2,slideVisible: false);
        }
      }
      );
  }
}