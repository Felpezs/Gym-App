import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/server/firestoreServer.dart';
import '../../model/treinos.dart';
import 'gym_info_event.dart';
import 'gym_info_state.dart';

class GymInfoBloc extends Bloc<GymInfoEvent, GymInfoState>{

  final FirestoreServer _databaseService = FirestoreServer.helper;
  TreinoCollection _treinoCollection = TreinoCollection();

  GymInfoBloc() : super(LoadingGymInfo()){
    
    _databaseService.streamTreino.listen((event) {
      _treinoCollection = event;
      add(UpdateTreino());
    });

    on<GetTreinos>((event, emit) async{
      _treinoCollection = await _databaseService.getTreinos();
      emit(GymInfoLoaded(treinoCollection: _treinoCollection));
    });

    on<InsertTreino>((event, emit) async{
      await _databaseService.insertTreino(event.nomeTreino);
    });

    on<UpdateTreino>((event, emit) async{
      emit(GymInfoLoaded(treinoCollection: _treinoCollection));
    });

    on<SelectedTreino>((event, emit) {
      String idTreino = _treinoCollection.idList[event.position];
      _databaseService.idTreino = idTreino;
    });

    add(GetTreinos());
  }
}