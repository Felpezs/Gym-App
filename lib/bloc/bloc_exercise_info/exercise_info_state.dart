import 'package:prog_mobile/model/exercicios.dart';

abstract class ExerciseInfoState{}

class LoadingExercises extends ExerciseInfoState{}
class ExercisesLoaded extends ExerciseInfoState{
  ExercicioCollection exercicioCollection;

  ExercisesLoaded({required this.exercicioCollection});
}