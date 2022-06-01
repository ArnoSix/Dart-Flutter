import 'package:flutter/material.dart';

// Widget para las categorías principales

class Opciones extends StatefulWidget{
  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  List<String> opciones = ['Opción 1', 'Opcion 2'];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: opciones.length,
            itemBuilder: (context, index) => buildOpciones(index),
          ),
          //itemCount: opciones.length,
          //itemBuilder: (context, index) => buildOpciones(index),
        )
      );
  }

  Widget buildOpciones(int index) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Text(
               opciones[index]
            ),
        ),
      ],
    );
  }
}
