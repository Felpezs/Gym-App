import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/server/firestoreServer.dart';
import '../../model/user_model.dart';
import 'user_info_event.dart';
import 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState>{

  final FirestoreServer _databaseService = FirestoreServer.helper;
  UserModel userModel = UserModel();

  UserInfoBloc() : super(Loading()){
    on<InsertInfo>((event, emit) async{
      try{
        await _databaseService.insertUserInfo(username: event.username, genero: event.genero, altura: event.altura, peso: event.peso);
        userModel = UserModel.withData(username: event.username, genero: event.genero, altura: event.altura, peso: event.peso);
        emit(PersonalInfo(userModel: userModel));
      }
      catch(e){
        emit(InfoError(message: 'Um erro ocorreu nas informacoes do usuario: {$e}'));
      }
    });
    
    on<GetInfo>((event, emit) async{
      try{
        userModel = await _databaseService.getUser();
        emit(PersonalInfo(userModel: userModel));
      }
      catch(e){
        emit(InfoError(message: 'Um erro ocorreu nas informacoes do usuario: {$e}'));
      }
    });

    on<UpdateInfo>((event, emit) async{
      try{
        await _databaseService.updateUserInfo(userModel: event.userModel);
        userModel = event.userModel;
        emit(PersonalInfo(userModel: userModel));
      }
      catch(e){
        emit(InfoError(message: 'Um erro ocorreu na atualizacao de informacoes do usuario: {$e}'));
      }
    });
    
    GetInfo();
  }
}