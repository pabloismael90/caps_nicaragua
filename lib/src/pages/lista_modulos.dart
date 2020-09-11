import 'package:caps_nicaragua/src/provider/modulo_provider.dart';
import 'package:flutter/material.dart';

class ListaModulos extends StatelessWidget {
  final modulosProvider = ModulosProvider();

  @override
  Widget build(BuildContext context) {

        final int curso_id = ModalRoute.of(context).settings.arguments;
        return FutureBuilder(
            future: modulosProvider.getModulos(curso_id),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if (snapshot.hasData) {
                return Scaffold(
                    body: SingleChildScrollView(
                    child: Column(
                        children: <Widget>[
                        SafeArea(
                            child: Container(
                            child: Text('Lista de Modulos'),
                            ),
                        ),
                        SingleChildScrollView(
                            child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                                children: <Widget>[
                                Text('Lista de Modulos'),
                                _cardmodulo(snapshot.data, context),
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

    Widget _cardmodulo(List modulo, BuildContext context) {
        return ListView.builder(
        itemBuilder: (context, index) {
            final cardCurso = Card(
            child: Column(
                children: <Widget>[
                
                Text(modulo[index].titulo),
                SizedBox(
                    height: 20.0,
                ),
                
                //Text(cursos[index].descripcion),
                ],
            ),
            );
            //print(cursos[index].getdescripcion());
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


}