

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
        id              = json['id'];
        titulo          = json['titulo'].toString();
        imagen          = json['imagen'];
        descripcion     = json['descripcion'];
        fecha           = json['fecha'];
    }
    //Metodo para obtener la foto
    getFotocurso() {
        if (imagen == null) {
            return 'https://picsum.photos/800/600';
        }else{
            return 'https://picsum.photos/800/600';
        }
    }
}

class Cursos {
    List<Curso> items = new List();

    Cursos.fromJsonList(List<dynamic> jsonList) {
        for (var item in jsonList) {
            final caps = new Curso.fromJsonMap(item);
            
            items.add(caps);
        }
    }
}