import 'package:flutter/material.dart';
import 'package:tienda_virtual/src/models/categoria_model.dart';

class PageViewCategorias extends StatelessWidget {
  final List<Categoria> categorias;
  final double altura;
  final Function siguientePagina;

  PageViewCategorias({@required this.categorias,@required this.altura,@required this.siguientePagina});
  
  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.2
  );

  @override
  Widget build(BuildContext context) {
    final _tamanoPantalla = MediaQuery.of(context).size;
    
    //agrego una listner al pageController para detectar cuando llego al final de la pagina y cargar mas categorias
    _pageController.addListener(() { 
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });
    
        return  
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                  //color: Colors.black87,
                   width: double.infinity,
                   height: altura,
                   child: PageView.builder(
                     controller: _pageController,
                     itemCount: categorias.length,
                     itemBuilder: (context,i){
                       return 
                       _poster(_tamanoPantalla,context,categorias[i]);
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
        Flexible(
          flex: 5,
            child: FadeInImage(
                  placeholder: AssetImage('assets/images/no_image.png'), 
                  image: NetworkImage(categoria.image.src),
                  fit: BoxFit.cover,
                  ),
        ),
          Flexible(
              flex: 1,
              child: Text(
              categoria.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
      ],
    ),
  );

  return poster;
}

}