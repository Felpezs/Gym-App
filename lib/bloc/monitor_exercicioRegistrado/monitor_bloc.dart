import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/model/colecaoExercicio.dart';

import '../../server/firestoreServer.dart';
import 'monitor_event.dart';
import 'monitor_state.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  ColecaoExercicio colecaoExercicio = ColecaoExercicio();

  MonitorBloc() : super(MonitorState(colecaoExercicio: ColecaoExercicio())) {
    // Leitura da Stream:
    FirestoreServer.helper.stream.listen((event) {
      colecaoExercicio = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      colecaoExercicio = await FirestoreServer.helper.getExercicioRegistrado();
      emit(MonitorState(colecaoExercicio: colecaoExercicio));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(colecaoExercicio: colecaoExercicio));
    });

    add(AskNewList());
  }
}
