
import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:tienda_virtual/src/models/categoria_model.dart';


class CategoriasProvider{
  String _url = 'videotecalatina.com';
  String _apiKey = 'ck_1d354e2a90115de84f32628d33cbf6457b2fb0c5';
  String _secretApiKey = 'cs_2ead46c9fc03127482e35ce9ac0f0879993bb70b';
  String _endPoint = "/wp-json/wc/v3/products/categories";
  int _categoryPage = 0;

  Future <List<Categoria>> getCategorias() async {
      _categoryPage++;
      final url = Uri.https(_url, _endPoint,{
        'consumer_key':_apiKey,
        'consumer_secret' : _secretApiKey,
        'page' : _categoryPage.toString(),
        });

      final respuesta = await http.get(url);
      final dataDecoded = json.decode(respuesta.body);
      final categorias = Categorias.fromJsonList(dataDecoded);
     
      return categorias.listaCat;
  }



}