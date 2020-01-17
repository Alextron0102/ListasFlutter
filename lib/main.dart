import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:segundaapp/ListaDatos.dart';
import 'package:segundaapp/Dato.dart';
import 'package:segundaapp/IngresoDatos.dart';
void main() => runApp(MaterialApp(
      home: Lista(),
    ));

class Lista extends StatefulWidget {
  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  ListaDatos dato = new ListaDatos();
  dynamic _boton = new Icon(Icons.add);
  Color _colorboton = new Color(Colors.grey[600].value);

  Function funcionBoton = (BuildContext context, ListaDatos dato) async {
    final datoUnico = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => IngresoDatos())) as Dato;
    dato.agregar(datoUnico);
  };
  void cambiarEstadoBoton() {
    if (dato.getSeleccionado() == false) {
      estadoAgregarBoton();
    }
    if (dato.getSeleccionado() == true) {
      estadoEliminarBoton();
    }
  }

  void estadoAgregarBoton() {
    _boton = Icon(Icons.add);
    funcionBoton = (BuildContext context, ListaDatos dato) async {
      final datoUnico = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => IngresoDatos())) as Dato;
      dato.agregar(datoUnico);
    };
    _colorboton = Color(Colors.grey[600].value);
  }

  void estadoEliminarBoton() {
    _boton = Icon(Icons.delete);
    funcionBoton = (BuildContext context, ListaDatos dato) async {
      setState(() {
        dato.eliminarSeleccionados();
        dato.getlista().map((dato) => datoCarta(dato)).toList();
      });
    };
    _colorboton = Color(Colors.red[600].value);
  }

  Widget datoCarta(Dato _dato) {
    return Card(
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CheckboxListTile(
                title: Text(
                  _dato.getTexto(),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                ),
                value: _dato.getEstado(),
                onChanged: (bool value) {
                  //Cuando se presiona alguno de los cuadros se realiza lo siguiente:
                  setState(() {
                    _dato.setEstado(value);
                    cambiarEstadoBoton();
                  });
                },
              ),
              SizedBox(height: 6.0),
              Text(
                _dato.getTiempo().toString(),
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title: Text('Lista de datos'),
            centerTitle: true,
            backgroundColor: Colors.grey[900]),
        body: new ListView(
          addAutomaticKeepAlives: true,
          children: dato.getlista().map((dato) => datoCarta(dato)).toList(),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              funcionBoton(context, dato);
            },
            child: _boton,
            backgroundColor: _colorboton));
  }
}
