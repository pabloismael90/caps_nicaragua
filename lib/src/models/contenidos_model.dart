//import 'package:html/parser.dart';

class Contenido {
    int id;
    int modulo;
    String titulo;
    String contenido;
    int order;
    String urlVideo;
    String nombreVideo;

    Contenido({
        this.id,
        this.modulo,
        this.titulo,
        this.contenido,
        this.order,
        this.urlVideo,
        this.nombreVideo,
    });

    Contenido.fromJsonMap(Map<String, dynamic> json) {
        id          = json['id'];
        modulo      = json['modulo'];
        titulo      = json['titulo'].toString();
        contenido   = json['contenido'];
        order       = json['order'];
        urlVideo    = json['urlVideo'];
        nombreVideo = json['nombreVideo'];
    }
    
}


class Contenidos {
    List<Contenido> items = new List();

    Contenidos.fromJsonList(List<dynamic> jsonList) {
            for (var item in jsonList) {
            final contenido = new Contenido.fromJsonMap(item);

            items.add(contenido);
        }
    }
}