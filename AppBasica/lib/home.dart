import 'package:flutter/material.dart';
import 'package:basicapp/body.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mi Aplicación",
            style: TextStyle(fontSize: 30)
            ),
          ),
      ),
      body: Body(),
    );
  }
}