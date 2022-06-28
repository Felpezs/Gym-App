import 'package:flutter_bloc/flutter_bloc.dart';

import '../../server/firestoreServer.dart';
import 'manage_event.dart';
import 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(
          IdExercicicio: event.IdExercicicio,
          exercicioAnterior: event.exercicioAnterior));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      FirestoreServer.helper.insertExercicioInfo(event.exercicioRegistrado);
    });
  }
}
