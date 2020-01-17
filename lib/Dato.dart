class Dato {
  String _texto;
  String _tiempo;
  int _posicion;
  bool _estado;

  Dato(String texto, String tiempo, int posicion) {
    _texto = texto;
    _tiempo = tiempo;
    _posicion = posicion;
    _estado = false;
  }
  //funciones get:
  String getTexto() {
    return _texto;
  }

  String getTiempo() {
    return _tiempo;
  }

  int getPosicion() {
    return _posicion;
  }

  bool getEstado() {
    return _estado;
  }

  //funciones set:
  void setTexto(String textoAux) {
    _texto = textoAux;
  }

  void setTiempo(String tiempo) {
    _tiempo = tiempo;
  }

  void setPosicion(int posicion) {
    _posicion = posicion;
  }

  void setEstado(bool estado) {
    _estado = estado;
  }
}
