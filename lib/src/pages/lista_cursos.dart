import 'package:caps_nicaragua/src/provider/curso_provider.dart';
import 'package:flutter/material.dart';

class ListaCursos extends StatelessWidget {
  final cursosprovider = CursosProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cursosprovider.getCursos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Column(
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
        itemBuilder: (context, index){
            final cardCurso = Card(
                child: Column(
                    children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Image.network(
                        'https://picsum.photos/800/600',
                        fit: BoxFit.cover,
                        ),
                    ),
                    Text(cursos[index].titulo),
                    SizedBox(
                        height: 20.0,
                    ),
                    Text(cursos[index].descripcion)
                    ],
                ),
            );

            return GestureDetector(
                child: cardCurso,
            );
        },
        shrinkWrap: true,
        itemCount: cursos.length,
        padding: EdgeInsets.only(bottom: 20.0),
        controller: ScrollController(keepScrollOffset: false),
    
    );
//     return Card(
//       child: Column(
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.only(bottom: 20.0),
//             child: Image.network(
//               'https://picsum.photos/800/600',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Text(cursos),
//           SizedBox(
//             height: 20.0,
//           ),
//           Text(
//               'Las Tecnologías de la Información y la Comunicación (TIC) es la suma de las herramientas tecnológicas de la informática y la comunicación que se pueden utilizar para mejorar el aprendizaje. ')
//         ],
//       ),
//     );
  }
}
