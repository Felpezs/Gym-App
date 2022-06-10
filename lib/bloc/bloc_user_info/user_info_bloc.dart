import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/server/firestoreServer.dart';
import 'user_info_event.dart';
import 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState>{

  final FirestoreServer _databaseService = FirestoreServer.helper;

  UserInfoBloc() : super(NotInserted()){
    on<InsertInfo>((event, emit) async{
      try{
        await _databaseService.insertUserInfo(username: event.username, genero: event.genero, altura: event.altura, peso: event.peso);
        emit(Inserted());
      }
      catch(e){
        emit(InfoError(message: 'Um erro ocorreu nas informacoes do usuario: {$e}'));
      }
    });
    /*
    on<GetInfo>(((event, emit) async{
      try{
        UserModel user = await _databaseService.getUser();
      }
      catch(e){
        emit(InfoError(message: 'Um erro ocorreu nas informacoes do usuario: {$e}'));
      }
    }))*/
  }
}