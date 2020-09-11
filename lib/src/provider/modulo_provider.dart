import 'dart:async';
import 'dart:convert';

import 'package:caps_nicaragua/src/models/modulos_model.dart';
import 'package:http/http.dart' as http;

class ModulosProvider {
  String _url = 'ampb.caps-nicaragua.org';

  Future<List<Modulo>> getModulos(int idcurso) async {
    final url = Uri.http(_url, '/aprende/api/modulos/');
    //print(url);
    //print(idcurso);
    return await _procesarRespuesta(url, idcurso);
  }

  Future<List<Modulo>> _procesarRespuesta(Uri url, int idcurso) async {
    final resp = await http.get(url); //metodo dos para optimizar codigo

    final decodedData = utf8.decode(resp.bodyBytes);
    final data = json.decode(decodedData);

    final modulos = new Modulos.fromJsonList(data, idcurso);


    return modulos.items;
  }
}
