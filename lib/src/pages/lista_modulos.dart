import 'package:caps_nicaragua/src/provider/contenido_provider.dart';
import 'package:caps_nicaragua/src/provider/modulo_provider.dart';
import 'package:flutter/material.dart';

class ListaModulos extends StatelessWidget {

    final modulosProvider = ModulosProvider();

    final contenidosProvider = ContenidosProvider();

    @override
    Widget build(BuildContext context) {
        final int cursoId = ModalRoute.of(context).settings.arguments;

        return FutureBuilder(
            future: Future.wait([
                modulosProvider.getModulos(cursoId),
                contenidosProvider.getContenidos()
            ]),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                return Scaffold(
                    body: SingleChildScrollView(
                        child: Column(
                            children: <Widget>[
                                SafeArea(
                                    child: Container(
                                    child: Text('Lista de temas'),
                                    ),
                                ),
                                SingleChildScrollView(
                                    child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Column(
                                            children: <Widget>[
                                                Text('Lista de temas'),
                                                _cardmodulo(snapshot.data[0], snapshot.data[1], context),
                                            ],
                                        ),
                                    ),
                                ),
                            ],
                        ),
                    ),
                );
                } else {
                    return Center(
                        child: CircularProgressIndicator(),
                    );
                }
            },
        );
    }

    Widget _cardmodulo(List modulo, List contenido, BuildContext context) {
        return ListView.builder(
            itemBuilder: (context, index) {
                final cardCurso = Card(
                    child: Column(
                        children: <Widget>[
                        Text('Modulo ${modulo[index].titulo} -- ${modulo[index].id}'),
                        SizedBox(
                            height: 20.0,
                        ),
                        _prueba(modulo[index].id, contenido, context)
                        //Text(cursos[index].descripcion),
                        ],
                    ),
                );
                //print(modulo[index].id);
                return GestureDetector(
                child: cardCurso,
                onTap: () => {},
                );
            },
            shrinkWrap: true,
            itemCount: modulo.length,
            padding: EdgeInsets.only(bottom: 20.0),
            controller: ScrollController(keepScrollOffset: false),
        );
    }

    Widget _prueba(int idModulo, contenido, BuildContext context) {
        for (var x in contenido) {
            if (x.modulo == idModulo) {
                //print(x.titulo);
                return GestureDetector(
                    child: ListTile(
                        title: Text(x.titulo),
                    ),
                    onTap: () {
                        //print(x.titulo);
                        Navigator.pushNamed(
                            context, 'detalle',
                            arguments: [x.titulo, x.contenido, x.urlVideo, x.nombreVideo]
                        );
                    },
                );
            }
        }
        return Container();
    }
}
