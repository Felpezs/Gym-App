import 'package:prog_mobile/model/exercicioRegistrado.dart';

abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  ExercicioRegistrado exercicioRegistrado;
  SubmitEvent({required this.exercicioRegistrado});
}

class DeleteEvent extends ManageEvent {
  String noteId;
  DeleteEvent({required this.noteId});
}

class UpdateRequest extends ManageEvent {
  String IdExercicicio;
  ExercicioRegistrado exercicioAnterior;
  UpdateRequest({required this.IdExercicicio, required this.exercicioAnterior});
}

class UpdateCancel extends ManageEvent {}
