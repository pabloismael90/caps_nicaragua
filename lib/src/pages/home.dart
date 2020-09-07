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
                                _titulos(),
                            ],
                            
                        ),
                    ),
                ],
            )
        );
    }


    Widget _titulos(){
        return Container(
            child: Column(
                children: <Widget>[
                    Text('Explorar Aplicaciones')
                ],
            )
        );
    }
}