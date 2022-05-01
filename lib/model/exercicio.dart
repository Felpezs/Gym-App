import 'serie.dart';

class Exercicio{
  final String nomeExercicio;
  List<Serie> _series = [];

  Exercicio({
    required this.nomeExercicio,
  });

  void adicionarSerie(){
    Serie serie = Serie();
    _series.add(serie);
  }

  String apresentarExercicio(){
    StringBuffer resultado = StringBuffer();
    resultado.writeln("Exercicio: $nomeExercicio");
    for(Serie serie in _series){
      resultado.writeln(serie.mostrarSerie());
    }
    return resultado.toString();
  }
}