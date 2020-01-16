import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: Lista(),
  )
);

class Dato{
  String _texto;
  String _tiempo;
  int _posicion;
  bool estado;
  Dato(String texto, String tiempo, int posicion){
    _texto = texto;
    _tiempo= tiempo;
    _posicion = posicion;
    estado= false;
  }
}
class ListaDatos {
  List<Dato> _lista = List<Dato>();
  int _contador=0;
  ListaDatos(){
    for (var i = 0; i < 15; i++) {
    agregar(Dato('EJEMPLO $i',DateTime.now().toString(), _contador));
    }
  }
  void agregar(Dato dato){
    dato._posicion = _contador;
    _lista.add(dato);
    _contador++;
  }
  void eliminar(int posicion){
    _lista.removeAt(posicion);
    _contador--;
    actualizarposiciones();
  }
  void actualizarposiciones(){
    for (var i = 0; i < _contador-1; i++) {
      if(_lista[i]._posicion!=_lista[i]._posicion+1){
        for (var j = i; j < _contador; j++) {
          _lista[i]._posicion = j;
        }
        break;
      }
    }
  }
  void modificar(String texto, String tiempo, int posicion){
    _lista[posicion] = Dato(texto, tiempo, posicion);
  }
  Dato getDato(int posicion){
    return _lista[posicion];
  }
}
class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}
class _ListaState extends State<Lista> {
  ListaDatos dato = new ListaDatos();
  Widget datoCarta(Dato _dato){
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            CheckboxListTile(
              title: Text(
                _dato._texto,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              value: _dato.estado,
              onChanged: (bool value){
                setState(() {
                  _dato.estado = value;
                });
              },
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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Lista de datos'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: ListView(
         children: dato._lista.map((dato)=>datoCarta(dato)).toList(),  
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: ()async {
        final datoUnico = await Navigator.push(context, 
        MaterialPageRoute(builder: (context)=>IngresoDatos())
        ) as Dato;
        dato.agregar(datoUnico);
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.grey[600],
    )
    );
  }
}
class IngresoDatos extends StatefulWidget {
  @override
  _IngresoDatosState createState() => _IngresoDatosState();
}
class _IngresoDatosState extends State<IngresoDatos> {
  final TextoDato = TextEditingController();
  final TextoFecha = TextEditingController(text: DateTime.now().toString());
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
            controller: TextoDato,
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
            controller: TextoFecha,
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
          hintText: 'dd/mm/aaaa'
          ),
        ),
        ),

      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        setState(() {
          Navigator.pop(context,Dato(TextoDato.text, TextoFecha.text,0));
        });
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.grey[900],
    ),
    );
  }
}