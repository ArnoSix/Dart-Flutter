import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// SQLite
void main() async{

  final database = openDatabase(

    join(await getDatabasesPath(), 'droides_database.db'),
    onCreate: (db, version) {
      return db.execute(
      "CREATE TABLE droides(id INTEGER PRIMARY KEY, tipo TEXT, modelo TEXT)",
      );
    },
    version: 1,
  );

  Future<void> insertarDroide(Droides droide) async{
    final db = await database;

    await db.insert(
      'droides',
      droide.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> actualizarDroide(Droides droide) async{
    final db = await database;

    await db.update(
        'droides',
        droide.toMap(),
        where: "id = ?",
        whereArgs: [droide.id],
    );
  }

  Future<void> eliminarDroide(Droides droide) async{
    final db = await database;

    await db.delete(
      'droides',
      where: "id = ?",
      whereArgs: [droide.id]
    );
  }

  Future<List<Droides>> droides() async{
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('droides');

    return List.generate(maps.length, (i) {
      return Droides(
        id: maps[i]['id'],
        tipo: maps[i]['tipo'],
        modelo: maps[i]['modelo'],
      );
    });
  }

  var bb8 = Droides(
    id: 1,
    tipo: 'Astromecánico',
    modelo: 'BB'
  );

  await insertarDroide(bb8);
}

class Droides {
   int? id;
   String? tipo;
   String? modelo;

   Droides({this.id, this.tipo, this.modelo});

   Map<String, dynamic> toMap(){
     return {
       'id': id,
       'tipo': tipo,
       'modelo': modelo,
     };
   }

}

// flutter run lib/main.dart