import 'serie.dart';

class Exercicio{
  String? _nomeExercicio;
  String? _categoria;
  List<Serie> _series = [];

  Exercicio();

  Exercicio.withData({nomeExercicio = "", categoria = ""});

  Exercicio.fromMap(map) {
    _nomeExercicio = map["nomeExercicio"];
    _categoria = map["categoria"];
  }

  get nomeExercicio{
    return _nomeExercicio;
  }

  get categoria{
    return _categoria;
  }
  
  void adicionarSerie(){
    Serie serie = Serie();
    _series.add(serie);
  }

}