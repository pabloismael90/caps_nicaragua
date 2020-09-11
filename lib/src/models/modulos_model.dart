class Modulo {
  int id;
  int curso;
  String titulo;
  int order;

  Modulo({
    this.id,
    this.curso,
    this.titulo,
    this.order,
  });

  //Metodo para resivir la informacion
  Modulo.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    curso = json['curso'];
    titulo = json['titulo'].toString();
    order = json['order'];
  }
}

class Modulos {
  List<Modulo> items = new List();

  Modulos.fromJsonList(List<dynamic> jsonList, int idcurso) {
    for (var item in jsonList) {
      final modulo = new Modulo.fromJsonMap(item);
      if(item['curso'] == idcurso){
          items.add(modulo);
      }
      
     // items.add(caps);
    }
  }
}
