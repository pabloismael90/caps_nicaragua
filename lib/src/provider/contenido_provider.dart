import 'package:caps_nicaragua/src/models/Contenidos_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class ContenidosProvider {
  String _url = 'ampb.caps-nicaragua.org';

  Future<List<Contenido>> getContenidos() async {
    final url = Uri.http(_url, '/aprende/api/contenidos/');
    //print(url);
    return await _procesarRespuesta(url);
  }

  Future<List<Contenido>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url); //metodo dos para optimizar codigo

    final decodedData = utf8.decode(resp.bodyBytes);
    //print(decodedData);
    final data = json.decode(decodedData);

    //print(data);
    final contenido = new Contenidos.fromJsonList(data);
    return contenido.items;
  }
}
