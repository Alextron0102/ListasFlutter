import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:segundaapp/Dato.dart';
import 'package:intl/intl.dart';
class IngresoDatos extends StatefulWidget {
  @override
  _IngresoDatosState createState() => _IngresoDatosState();
}
class _IngresoDatosState extends State<IngresoDatos> {
  final textoDato = TextEditingController();
  final textoFecha = TextEditingController(text: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text('Ingreso de dato'),
          centerTitle: true,
          backgroundColor: Colors.grey[900]),
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Text(
                'Dato: ',
              )),
          Container(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: textoDato,
              autocorrect: false,
              maxLines: 3,
              maxLength: 50,
              textAlign: TextAlign.justify,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.grey[600],
                  filled: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                  hintText: 'texto de ejemplo'),
            ),
          ),
          Container(alignment: Alignment.center, child: Text('Fecha: ')),
          Container(
            padding: EdgeInsets.all(30.0),
            child: TextField(
              controller: textoFecha,
              autocorrect: false,
              maxLines: 1,
              maxLength: 26,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.grey[600],
                  filled: true,
                  contentPadding:
                      EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                  hintText: 'dd/mm/aaaa'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pop(context, Dato(textoDato.text, textoFecha.text, 0));
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
