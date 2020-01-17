import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:segundaapp/Dato.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// class DatabaseHelper {
//   static final _databaseName = "NotasDB.db";
//   static final _databaseVersion = 1;
//   static final table = 'Notas';
//   static final columnId = '_posicion';
//   static final columnText = 'Texto';
//   static final columnDate = 'Fecha';

//   // make this a singleton class
//   DatabaseHelper._privateConstructor();
//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   // only have a single app-wide reference to the database
//   static Database _database;
//   Future<Database> get database async {
//     if (_database != null) return _database;
//     // lazily instantiate the db the first time it is accessed
//     _database = await _initDatabase();
//     return _database;
//   }

//   // Para crear o abrir la bd:
//   Future<Database>_initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   // SQL code to create the database table
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId INTEGER PRIMARY KEY,
//             $columnText TEXT NOT NULL,
//             $columnDate INTEGER NOT NULL
//           )
//           ''');
//   }

//   // Helper methods

//   // Inserts a row in the database where each key in the Map is a column name
//   // and the value is the column value. The return value is the id of the
//   // inserted row.
//   Future<int> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(table, row);
//   }

//   // All of the rows are returned as a list of maps, where each map is
//   // a key-value list of columns.
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     Database db = await instance.database;
//     return await db.query(table);
//   }

//   // All of the methods (insert, query, update, delete) can also be done using
//   // raw SQL commands. This method uses a raw query to give the row count.
//   Future<int> queryRowCount() async {
//     Database db = await instance.database;
//     return Sqflite.firstIntValue(
//         await db.rawQuery('SELECT COUNT(*) FROM $table'));
//   }

//   // We are assuming here that the id column in the map is set. The other
//   // column values will be used to update the row.
//   Future<int> update(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     int id = row[columnId];
//     return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
//   }

//   // Deletes the row specified by the id. The number of affected rows is
//   // returned. This should be 1 as long as the row exists.
//   Future<int> delete(int id) async {
//     Database db = await instance.database;
//     return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
//   }
// }
class ListaDatos {
  List<Dato> _lista = List<Dato>();
  int _contador = 0;
  ListaDatos() {
    for (var i = 0; i < 5; i++) {
      agregar(Dato('EJEMPLO $i',
          DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()), _contador));
    }
  }
  void agregar(Dato dato) {
    if (dato != null) {
      dato.setPosicion(_contador);
      _lista.add(dato);
      _contador++;
    }
  }

  void eliminarSeleccionados() {
    for (int i = 0; i < _lista.length; i++) {
      if (_lista[i].getEstado() == true) {
        _lista.removeAt(i);
        _contador--;
        i = 0;
      }
    }
    actualizarposiciones();
  }

  bool getSeleccionado() {
    bool _seleccionados = false;
    for (var i = 0; i < _contador; i++) {
      if (_lista[i].getEstado() == true) {
        _seleccionados = true;
        break;
      }
    }
    return _seleccionados;
  }

  void actualizarposiciones() {
    for (var i = 0; i < _lista.length - 1; i++) {
      if (_lista[i].getPosicion() + 1 != _lista[i + 1].getPosicion()) {
        for (var j = i; j < _lista.length; j++) {
          _lista[i].setPosicion(j);
        }
        break;
      }
    }
  }

  void modificar(String texto, String tiempo, int posicion) {
    _lista[posicion].setTexto(texto);
    _lista[posicion].setTiempo(tiempo);
  }

  Dato getDato(int posicion) {
    return _lista[posicion];
  }

  List<Dato> getlista() {
    return _lista;
  }

  int getContador() {
    return _lista.length;
  }
}
