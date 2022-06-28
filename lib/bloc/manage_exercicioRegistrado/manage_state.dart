import 'package:prog_mobile/model/exercicioRegistrado.dart';

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String IdExercicicio;
  ExercicioRegistrado exercicioAnterior;
  UpdateState({required this.IdExercicicio, required this.exercicioAnterior});
}
