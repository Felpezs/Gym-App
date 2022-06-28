import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/model/exercicios.dart';
import 'package:prog_mobile/server/firestoreServer.dart';

import 'exercise_info_event.dart';
import 'exercise_info_state.dart';

class ExerciseInfoBloc extends Bloc<ExerciseInfoEvent, ExerciseInfoState>{
  final FirestoreServer _databaseService = FirestoreServer.helper;
  ExercicioCollection _exercicioCollection = ExercicioCollection();

  ExerciseInfoBloc() : super(LoadingExercises()){
    _databaseService.streamExercicio.listen((event) {
      _exercicioCollection = event;
      add(UpdateExercicio());
    });

    on<GetExercicios>((event, emit) async{
      _exercicioCollection = await _databaseService.getExercicios();
      emit(ExercisesLoaded(exercicioCollection: _exercicioCollection));
    });

    on<UpdateExercicio>((event, emit) async{
      emit(ExercisesLoaded(exercicioCollection: _exercicioCollection));
    });

    add(GetExercicios());
  }
  
}