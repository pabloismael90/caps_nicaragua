import 'package:caps_nicaragua/src/models/cursos_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class CursosProvider {
    String _url = 'ampb.caps-nicaragua.org';

    Future<List<Curso>> getCursos() async {
        final url = Uri.http(_url, '/aprende/api/cursos/');
        //print(url);
        return await _procesarRespuesta(url);
    }

    Future<List<Curso>> _procesarRespuesta(Uri url) async {
        final resp = await http.get(url); //metodo dos para optimizar codigo
        
        final decodedData = utf8.decode(resp.bodyBytes);
        final data = json.decode(decodedData);
        
        final caps = new Cursos.fromJsonList(data);
        return caps.items;
    }
}
