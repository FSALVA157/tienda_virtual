import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/models/categoria_model.dart';

class PageViewCategorias extends StatelessWidget {
  final List<Categoria> categorias;

  PageViewCategorias({@required this.categorias});
  
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.1
  );

  @override
  Widget build(BuildContext context) {
    final _tamanoPantalla = MediaQuery.of(context).size;
    double altura = _tamanoPantalla.height * 0.1; 
    
    // return Container(
    //       width: _tamanoPantalla.width,
    //       height: altura,
    //       child: 
        return  
                Container(
                  padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                   width: double.infinity,
                   height: altura,
                   child: PageView.builder(
                     controller: _pageController,
                     itemCount: categorias.length,
                     itemBuilder: (context,i){
                       return _poster(_tamanoPantalla,context,categorias[i]);
                     }
                     ),
     
   );
  }

Widget _poster(final size,BuildContext context,Categoria categoria){

  final poster = Container(
   //height: size.height * 0.05,
   // width: size.width * 0.005,
   padding: EdgeInsets.symmetric(horizontal: 5.0),
    child: Column(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/images/no_image.png'), 
          image: NetworkImage(categoria.image.src),
          fit: BoxFit.cover,
          ),
          Text(
            categoria.name,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
          ),
      ],
    ),
  );

  return poster;
}

}