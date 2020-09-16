//import 'package:caps_nicaragua/src/models/contenidos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class DetalleTema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List tema = ModalRoute.of(context).settings.arguments;


    return SafeArea(

        child: Scaffold(
            body:CustomScrollView(
                slivers: <Widget>[
                    _crearAppbar(tema),
                    SliverList(
                        delegate: SliverChildListDelegate(
                            [
                                SizedBox(height: 10.0,),
                                _descripcion(tema),
                            ]
                        ),
                    )
                ],
            ),
        ),
    );
  }

  Widget _crearAppbar(List tema) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          tema[0],
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage('https://picsum.photos/800/600'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _descripcion(List tema) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Html(
        data:_getimg(tema[1]),
      ),
    );
  }

    String _getimg( String contenido) {
        var img = parse(contenido.replaceAll(
        '/media/', 'http://ampb.caps-nicaragua.org/media/'));
        return img.outerHtml;
    }

}
