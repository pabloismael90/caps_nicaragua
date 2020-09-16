//import 'package:html/dom.dart' as dom;
//import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

class Curso {
  int id;
  String titulo;
  String imagen;
  String descripcion;
  String fecha;

  Curso({
    this.id,
    this.titulo,
    this.imagen,
    this.descripcion,
    this.fecha,
  });
  //Metodo para resivir la informacion
  Curso.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'].toString();
    imagen = json['imagen'];
    descripcion = json['descripcion'];
    fecha = json['fecha'];
  }
  //Metodo para obtener la foto
  getFotocurso() {
    if (imagen == null) {
      return 'https://picsum.photos/800/600';
    } else {
      return 'https://picsum.photos/800/600';
    }
  }

  getdescripcion() {
    var img = parse(descripcion.replaceAll(
        '/media/', 'http://ampb.caps-nicaragua.org/media/'));

        //remplazar por imagen local
        //descripcion.replaceAll('/media/uploads/2020/09/11/', 'asset:assets/img/'));
        //print(img.outerHtml);
    return img.outerHtml;


    //hacer una lista de imagenes
    // var imgList = document.querySelectorAll("img");

    // for (dom.Element img in imgList) {
    //   String urlimg = img.attributes["src"];

    //   print(urlimg);
    // }
  }
}

class Cursos {
  List<Curso> items = new List();

    Cursos.fromJsonList(List<dynamic> jsonList) {
        for (var item in jsonList) {
            final curso = new Curso.fromJsonMap(item);

            items.add(curso);
        }
    }
}
