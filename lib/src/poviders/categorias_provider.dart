
import 'package:tienda_virtual/src/widgets/listview_categorias.dart';

class CategoriasProvider{
  String _url = 'videotecalatina.com';
  String _apiKey = 'ck_1d354e2a90115de84f32628d33cbf6457b2fb0c5';
  String _secretApiKey = 'cs_2ead46c9fc03127482e35ce9ac0f0879993bb70b';
  String _endPoint = '/wp-json/wc/v3/products/categories';

  Future <List<Categorias>> getCategorias() async {

      final url = Uri.https(_url, _endPoint,{
        'consumer_key':_apiKey,
        'consumer_secret' : _secretApiKey
        });
  }



}