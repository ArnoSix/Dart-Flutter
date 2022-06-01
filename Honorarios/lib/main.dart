import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honorarios',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: MyHomePage(title: 'Calculo Honorarios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum SingingCharacter { bruto, liquido }

final txtHoras = TextEditingController();
final txtValorHoras = TextEditingController();
final txtHonorarios = TextEditingController();
final txtRetencion = TextEditingController();
final txtTotal = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  SingingCharacter? _character; //= SingingCharacter.liquido;

  @override
  void initState() {
    super.initState();
    txtHonorarios.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // Radio
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Seleccionar método de cálculo'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Líquido'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.liquido,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Bruto'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.bruto,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Ingresar Horas',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'horas', border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      controller: txtHoras,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Ingresar Valor por hora',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'valor', border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      controller: txtValorHoras,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              child: Text('Calcular'),
              onPressed: () {
                setState(() {
                  if (_character.toString() ==
                      "SingingCharacter.liquido") {
                    Parser p = new Parser();
                    ContextModel cm = new ContextModel();

                    String calcular = txtHoras.text.toString() +
                        "*" +
                        txtValorHoras.text.toString();
                    String total = calcular + "/0.885";
                    String retencion = total + "-" + calcular;

                    Expression exp = p.parse(calcular);
                    Expression exp2 = p.parse(total);
                    Expression exp3 = p.parse(retencion);

                    txtHonorarios.text =
                        exp.evaluate(EvaluationType.REAL, cm).toString();
                    txtTotal.text =
                        exp2.evaluate(EvaluationType.REAL, cm).toString();
                    txtRetencion.text =
                        exp3.evaluate(EvaluationType.REAL, cm).toString();
                  }
                  if (_character.toString() ==
                      "SingingCharacter.bruto") {
                    int total = int.parse(txtHoras.text) *
                        int.parse(txtValorHoras.text);
                    double retencion = total * 0.115;
                    double honorarios = total - retencion;

                    txtHonorarios.text = honorarios.toString();
                    txtRetencion.text = retencion.toString();
                    txtTotal.text = total.toString();
                  }
                });
              },
            ),
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                    'El cálculo será efectuado con el 11.5 % de retención'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Total Honorarios:',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      keyboardType: TextInputType.number,
                      controller: txtHonorarios,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Retención:',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      keyboardType: TextInputType.number,
                      controller: txtRetencion,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Total Boleta:',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: ''),
                      keyboardType: TextInputType.number,
                      controller: txtTotal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
