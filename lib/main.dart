import 'package:caps_nicaragua/src/pages/home.dart';
import 'package:caps_nicaragua/src/pages/lista_cursos.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        //     statusBarColor: ThemeData().primaryColor,
        // ));

        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CAPS Nicaragua',
            initialRoute: 'lista_cursos',
            routes: {
                'home' : (BuildContext context) => HomePage(),
                'lista_cursos' : (BuildContext context) => ListaCursos(),
            },
            theme: ThemeData(
                // Colores predeterminados
                primaryColor: Color.fromRGBO(61, 180,  217, 1),
                accentColor: Color.fromRGBO(0, 110, 245, 1),

                //Fuente
                fontFamily: 'Museo',

                textTheme: TextTheme(
                    headline1: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'Museo', color: Colors.white),
                    headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, fontFamily: 'Museo', color: Colors.white),
                    bodyText2: TextStyle(fontSize: 16.0,),
                ),
            ),
            
        );
    }
}
