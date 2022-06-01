import 'package:flutter/material.dart';
import 'package:basicapp/Categorias.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
              "Principal",
            //style: TextStyle(color: Colors.blue)
            style: Theme.of(context).textTheme.headline5
          ),
        ),
        Opciones(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                      'Recuadro 1',
                      style: TextStyle(color: Colors.white)
                  ),
                  color: Colors.grey
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Recuadro 2',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueGrey
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Recuadro 3',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blueGrey
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Recuadro 4',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blueGrey
                ),
              ],
            )
          )
        )
      ],
    );
  }
}