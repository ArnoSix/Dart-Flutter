import 'package:flutter/material.dart';
import 'package:basicapp/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

/* Scaffold
Implementa una structura de diseño(layout) visual básica
appBar, BackgroundColor, body, bottomNavigationBar, floatingActionButton etc
 */

class _LoginState extends State<Login> {
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
              child: Text(
                  "Bienvenido",
                  style: TextStyle(fontSize: 30)
              ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      //child: Image.asset('assets/imagenes/arcaneflight2.jpeg')
                      //child: Image(
                      //  image: AssetImage('assets/imagenes/arcaneflight2.jpeg'),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top:15.0, bottom: 15.0 ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo',
                      hintText: 'Ingresar un correo valido'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right:15.0, top:15.0, bottom: 15.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                        hintText: 'Ingresar Contraseña',
                      ),
                  ),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text(
                    'Contraseña'
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Home())
                        );
                      },
                      child: Text(
                          'Ingresar',
                        style: TextStyle(color: Colors.white, fontSize: 20)
                      ),
                    ),
                  ),
                SizedBox(
                  height: 150,
                ),
                Text('Crear Nuevo Usuario')
              ],
            ),
        ),
    );
  }
}
