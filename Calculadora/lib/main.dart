

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Calculadora'),
    );
  }
}

String entrada = "";
final txtEntrada = TextEditingController();
final txtResultado = TextEditingController();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    super.initState();
    txtEntrada.addListener(() { });
    txtResultado.addListener(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: "0",
                hintStyle: TextStyle(
                  fontSize: 50
                ),
              ),
              textAlign: TextAlign.right,
              controller: txtEntrada,
              style: TextStyle(
                fontSize: 40
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              decoration: InputDecoration.collapsed(
                  hintText: 'Resultado',
                hintStyle: TextStyle(
                  fontSize: 50
                )
              ),
              textAlign: TextAlign.right,
              controller: txtResultado,
              style: TextStyle(
                fontSize: 40
              )
            ),
          ),
          SizedBox( height: 50),
          Row(
            children: <Widget>[
              btnAC("AC"),
              btnBorrar(),
              boton("%", Colors.blue),
              boton("/", Colors.blue)
            ],
          ),
          Row(
            children: <Widget>[
                boton("7", Colors.blue),
                boton("8", Colors.blue),
                boton("9", Colors.blue),
                boton("*", Colors.blue)
            ],
          ),
          Row(
            children: <Widget>[
              boton("4", Colors.blue),
              boton("5", Colors.blue),
              boton("6", Colors.blue),
              boton("-", Colors.blue)
            ],
          ),
          Row(
            children: <Widget>[
              boton("1", Colors.blue),
              boton("2", Colors.blue),
              boton("3", Colors.blue),
              boton("+", Colors.blue)
            ],
          ),
          Row(
            children: <Widget>[
              boton("0", Colors.blue),
              boton(".", Colors.blue),
              btnIgual(),
            ],
          ),
        ],
      ),
    );
  }

  Widget boton(btnValor, Color btnColor){
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btnValor,
          style: TextStyle(
            fontSize: 40,
            color: btnColor
          ),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = txtEntrada.text + btnValor;
          });
        },
        // color: btnColor,
        padding: EdgeInsets.all(5),
        splashColor: Colors.blueAccent,
      ),
    );
  }

  // Boton borrar
  Widget btnBorrar(){
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Icon(Icons.backspace, size: 40, color: Colors.blueGrey),
        onPressed: (){
          txtEntrada.text = (txtEntrada.text.length > 0 )  ? (txtEntrada.text.substring(0, txtEntrada.text.length - 1)): "";
        },
        splashColor: Colors.blueAccent,
      ),
    );
  }

  Widget btnAC(btntext){
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          btntext,
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.blue
          ),
        ),
        onPressed: () {
          setState(() {
            txtEntrada.text = "";
            txtResultado.text = "";
          });
        },
        splashColor: Colors.blueAccent,
      ),
    );
  }

  Widget btnIgual(){
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: FlatButton(
        child: Text(
          "=",
          style: TextStyle(
            fontSize: 40.0,
            color: Colors.blue
          ),
        ),
        onPressed: () {
          Parser p = new Parser();
          ContextModel cm = new ContextModel();
          Expression exp = p.parse(txtEntrada.text);
          setState(() {
            txtResultado.text = exp.evaluate(EvaluationType.REAL, cm).toString();
          });
        } ,
        splashColor: Colors.blueAccent,
      ),
    );
  }
}
