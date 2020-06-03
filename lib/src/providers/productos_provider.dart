import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:tienda_virtual/src/models/producto_model.dart';

class ProductosProvider{
  String _url = 'videotecalatina.com';
  String _apiKey = 'ck_1d354e2a90115de84f32628d33cbf6457b2fb0c5';
  String _secretApiKey = 'cs_2ead46c9fc03127482e35ce9ac0f0879993bb70b';
  String _endPoint = '/wp-json/wc/v3/products';
  int _productsPage = 0;
  bool _cargando = false;

  //manejo de stream
  List<Producto> _productsList = new List();
  final _productsStreamController = new StreamController<List<Producto>>.broadcast();

  //getter que introduce datos al stream
  Function(List<Producto>) get productsSink => _productsStreamController.sink.add;

  //getter que saca datos del stream
  Stream<List<Producto>> get productsStream => _productsStreamController.stream;

  void disposeStreams(){
    _productsStreamController?.close();
  } 
  //fin definicion del stream para productos

  //seccion de trabajo para productos en oferta
  Future <List<Producto>> getOfertas() async {
    if(_cargando) return [];

      _cargando = true;
      _productsPage++;
      final url = Uri.https(_url, _endPoint,{
        'consumer_key':_apiKey,
        'consumer_secret' : _secretApiKey,
        'page' : _productsPage.toString(),
        'on_sale' : 'true',
        });

      final respuestahttp = await http.get(url);
      //validacion para el final de pagina
      if(respuestahttp == null){
        
        return [];
      }

      final listado = await compute(parseProductos,respuestahttp.body);
      //print (resp);
      //cargar el stream
          _productsList.addAll(listado);
          productsSink(_productsList);
          _cargando = false;
      return listado;
      
  }

  //funcion sacada de la clase para poder ser utilizada por el isolate
   static  List<Producto> parseProductos(String respuestaBody){
         final dataDecoded = json.decode(respuestaBody);
         final productos = Productos.fromJsonList(dataDecoded);
        //  for (var item in productos.listaProductos) {
        //    print (item.name);
        //  }
         return productos.listaProductos;
       }

  //fin de seccion para productos en oferta



}