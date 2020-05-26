
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

import 'package:tienda_virtual/src/models/categoria_model.dart';


class CategoriasProvider{
  String _url = 'videotecalatina.com';
  String _apiKey = 'ck_1d354e2a90115de84f32628d33cbf6457b2fb0c5';
  String _secretApiKey = 'cs_2ead46c9fc03127482e35ce9ac0f0879993bb70b';
  String _endPoint = "/wp-json/wc/v3/products/categories";
  int _categoryPage = 0;
  bool _cargando = false;

  //manejo de stream
  List<Categoria> _categoriasList = new List();
  final _categoriasStreamController = new StreamController<List<Categoria>>.broadcast();

  //getter que introduce datos al stream
  Function(List<Categoria>) get categoriasSink => _categoriasStreamController.sink.add;

  //getter que saca datos del stream
  Stream<List<Categoria>> get categoriasStream => _categoriasStreamController.stream;

  void disposeStreams(){
    _categoriasStreamController?.close();
  } 
  //fin definicion del stream para categoria

  Future <List<Categoria>> getCategorias() async {
    if(_cargando) return [];

      _cargando = true;
      _categoryPage++;
      final url = Uri.https(_url, _endPoint,{
        'consumer_key':_apiKey,
        'consumer_secret' : _secretApiKey,
        'page' : _categoryPage.toString(),
        //'page' : '2',
        });

      final respuesta = await http.get(url);
      //validacion para el final de pagina
      if(respuesta == null){
        //_categoryPage = -1;
        return [];
      }

      // final dataDecoded = json.decode(respuesta.body);
      // final categorias = Categorias.fromJsonList(dataDecoded);

      //implementaciond de hilo o isolate usando compute
      //  List<Categoria> parseCategorias(String respuestaBody){
      //   final dataDecoded = json.decode(respuestaBody);
      //   final categorias = Categorias.fromJsonList(dataDecoded);
      //   return categorias.listaCat;
      // }

      final resp = await compute(parseCategorias,respuesta.body);

     
     //cargar el stream
      //final resp = categorias.listaCat;
      _categoriasList.addAll(resp);
      categoriasSink(_categoriasList);
      _cargando = false;
      return resp;
      
  }
   static  List<Categoria> parseCategorias(String respuestaBody){
         final dataDecoded = json.decode(respuestaBody);
         final categorias = Categorias.fromJsonList(dataDecoded);
         return categorias.listaCat;
       }

}