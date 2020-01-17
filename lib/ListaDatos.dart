import 'package:segundaapp/Dato.dart';

class ListaDatos {
  List<Dato> _lista = List<Dato>();
  int _contador = 0;
  ListaDatos() {
    for (var i = 0; i < 10; i++) {
      agregar(Dato('EJEMPLO $i', DateTime.now().toString(), _contador));
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
    for (var i = 0; i < _contador; i++) {
        if (_lista[i].getEstado() == true) {
        _lista[i].setEstado(false);
        _lista.removeAt(i);
        _contador--;
        i=0;
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
    for (var i = 0; i < _contador - 1; i++) {
      if (_lista[i].getPosicion() + 1 != _lista[i + 1].getPosicion()) {
        for (var j = i; j < _contador; j++) {
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
}
