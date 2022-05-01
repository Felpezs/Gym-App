class Serie{
  int _carga = 0;
  int _repeticao = 0;

  String mostrarSerie(){
    return "Carga: $_carga Repeticoes: $_repeticao";
  }

  set carga(int c){
    carga = c;
  }

  int get carga{
    return _carga;
  }

  set repeticao(int r){
    _repeticao = r;
  }

  int get repeticao{
    return _repeticao;
  }
}