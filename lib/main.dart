import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: QuoteList(),
  )
);

class Dato{
  String _texto;
  TimeOfDay _tiempo;
  int _posicion;
  Dato(String texto, TimeOfDay tiempo, int posicion){
    _texto = texto;
    _tiempo= tiempo;
    _posicion = posicion;
  }
}
class ListaDatos {
  List<Dato> _lista = List<Dato>();
  int _contador=0;
  ListaDatos(){
    _lista.add(Dato('EJEMPLO',TimeOfDay.now(),0));
  }
  void agregar(String texto, TimeOfDay tiempo){
    _lista.add(Dato(texto, tiempo, _contador));
  }
  void eliminar(int posicion){
    _lista.removeAt(posicion);
  }
  void modificar(String texto, TimeOfDay tiempo, int posicion){
    _lista[posicion] = Dato(texto, tiempo, posicion);
  }
  Dato getDato(int posicion){
    return _lista[posicion];
  }
}
class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}
class _QuoteListState extends State<QuoteList> {
  ListaDatos dato = new ListaDatos();
  Widget datoCarta(Dato _dato){
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _dato._texto,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              _dato._tiempo.toString(),
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      )
    );
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Lista de datos'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
         children: dato._lista.map((dato)=>datoCarta(dato)).toList(),  
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context)=>IngresoDatos()));
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.red[600],
    )
    );
  }
}
class IngresoDatos extends StatefulWidget {
  @override
  _IngresoDatosState createState() => _IngresoDatosState();
}
class _IngresoDatosState extends State<IngresoDatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar
      (
        title: Text('Ingreso de dato'),
        centerTitle: true,
        backgroundColor: Colors.grey[900]
      ),
      body: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(  
            'Dato: ',
            )
        ),
        Container(
          padding: EdgeInsets.all(30.0),
          child:   TextField(
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
          // border: InputBorder.none,
          hintText: '...'
          ),
        ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text('Fecha: ')
          ),
        Container(
          padding: EdgeInsets.all(30.0),
          child:   TextField(
            autocorrect: false,
          maxLines: 1,
          maxLength: 10,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.grey[600],
            filled: true,
            contentPadding:
          EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
          hintText: 'dd/mm/aaaa'
          ),
        ),
        ),

      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        setState(() {

          Navigator.pop(context,);
        });
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.grey[900],
    ),
    );
  }
}