import 'package:prog_mobile/model/exercicio.dart';

abstract class ExerciseInfoEvent{}


class GetExercicios extends ExerciseInfoEvent{}
class UpdateExercicio extends ExerciseInfoEvent{}
class InsertExercicio extends ExerciseInfoEvent{
  Exercicio exercicio;
  InsertExercicio({required this.exercicio});
}

class InsertExecucao extends ExerciseInfoEvent{
  int position;
  String carga;
  String repeticao;
  String serie;
  InsertExecucao({required this.position, required this.carga, required this.repeticao, required this.serie});
}

class UpdateExecucao extends ExerciseInfoEvent{
  int position;
  String carga;
  String repeticao;
  String serie;
  UpdateExecucao({required this.position, required this.carga, required this.repeticao, required this.serie});
}

class DeleteExercicio extends ExerciseInfoEvent{
  int position;
  DeleteExercicio({required this.position});
}