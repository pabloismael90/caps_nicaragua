import 'package:caps_nicaragua/src/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'CAPS Nicaragua',
            initialRoute: 'home',
            routes: {
                'home' : (BuildContext context) => HomePage(),
            },
            theme: ThemeData(
                // Colores predeterminados
                primaryColor: Color.fromRGBO(61, 180,  217, 1),
                accentColor: Color.fromRGBO(0, 110, 245, 1),

                //Fuente
                fontFamily: 'Museo',

                textTheme: TextTheme(
                    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, fontFamily: 'Museo'),
                    headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Museo'),
                    bodyText2: TextStyle(fontSize: 16.0,),
                ),
            ),
            
        );
    }
}
