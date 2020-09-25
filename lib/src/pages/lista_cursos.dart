import 'package:caps_nicaragua/src/provider/curso_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ListaCursos extends StatelessWidget {
  final cursosprovider = CursosProvider();

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: cursosprovider.getCursos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      child: Text('Lista de Cursos'),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: <Widget>[
                          _cardcurso(snapshot.data, context),
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

  Widget _cardcurso(List cursos, BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final cardCurso = Card(
          child: Column(
            children: <Widget>[
            //   Container(
            //     padding: EdgeInsets.only(bottom: 20.0),
            //     child: Image.network(
            //       cursos[index].imagen,
            //       fit: BoxFit.cover,
            //     ),
            //   ),
              Text(cursos[index].titulo),
              SizedBox(
                height: 20.0,
              ),
              Html(
                data: cursos[index].getdescripcion(),
              ),
              //Text(cursos[index].descripcion),
            ],
          ),
        );
        //print(cursos[index].getdescripcion());
        return GestureDetector(
          child: cardCurso,
          onTap: () => Navigator.pushNamed(context, 'lista_modulos', arguments: cursos[index].id),
        );
      },
      shrinkWrap: true,
      itemCount: cursos.length,
      padding: EdgeInsets.only(bottom: 20.0),
      controller: ScrollController(keepScrollOffset: false),
    );
  }
}
