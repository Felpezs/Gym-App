import 'exercicio.dart';

class Treino{
  String? _id;
  String? _nomeTreino;
  //List<Exercicio> _exercicios = [];

  Treino();

  Treino.withData({id="", nomeTreino = ""});

  Treino.fromMap(map) {
    _nomeTreino = map["nomeTreino"];
  }

  get id{
    return _id;
  }
  
  get nomeTreino{
    return _nomeTreino;
  }
/*
  void adicionarExercicio(Exercicio exercicio){
    _exercicios.add(exercicio);
  }*/
}
