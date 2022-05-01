import 'package:flutter/foundation.dart';
import 'exercicio.dart';

class Treino{
  final String nomeTreino;
  final List<Exercicio> _exercicios = [];

  Treino({
    required this.nomeTreino,
  });

  void adicionarExercicio(Exercicio exercicio){
    _exercicios.add(exercicio);
  }
}
