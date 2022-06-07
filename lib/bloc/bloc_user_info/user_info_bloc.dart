import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/server/firestoreServer.dart';
import 'user_info_event.dart';
import 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState>{

  final FirestoreServer _databaseService = FirestoreServer.helper;

  UserInfoBloc() : super(PersonalInfoState()){
    on<FirstEntry>((event, emit){
      try{
        
      }
      catch(e){
        emit(UserInfoError(message: 'Um erro ocorreu: {$e}'));
      }
    });

    on<AddPersonalInfoEvent>((event, emit){

    });
  }
}