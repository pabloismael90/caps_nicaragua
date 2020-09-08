import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget>[
                    Container(
                        color: ThemeData().accentColor,
                    ),
                    SingleChildScrollView(
                        child: Column(
                            children: <Widget> [
                                _titulos(context),
                                _aplicacionaccess(),
                            ],
                            
                        ),
                    ),
                ],
            )
        );
    }


    Widget _titulos(BuildContext context){
        return SafeArea(
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        SizedBox( height: 30.0,),
                        Text('Explorar Aplicaciones', style: Theme.of(context).textTheme.headline1,),
                        SizedBox( height: 10.0,),
                        Text(
                            'Seleccione una aplicación para continuar', 
                            style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 10.0,)
                    ],
                )
            ),
        );
    }

    Widget _aplicacionaccess() {
        return Table(
            children: [
                TableRow(
                    children: [
                        _botonapp(),
                        _botonapp(),
                    ]
                ),
                TableRow(
                    children: [
                        _botonapp(),
                        Container(
                            height: 180.0,
                            margin: EdgeInsets.all(15.0),
                            // decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(20.0)
                            // ),
                            child: SizedBox(),
                        )
                    ]
                )
            ],
        );
    }

    Widget _botonapp(){
        return GestureDetector(
            onTap: () => print("click"),
            child: Container(
                height: 180.0,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                        CircleAvatar(
                            backgroundColor: ThemeData().primaryColor,
                            radius: 40.0,
                            child: Icon(Icons.computer, color: Colors.white, size: 40.0,),
                        ),
                        Text('Aprende')
                        
                    ],
                ),
            ),
        );
    }
}