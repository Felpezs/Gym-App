import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_event.dart';
import 'sign_state.dart';
import '../../server/rest_provider.dart';

class SignBloc extends Bloc<SignEvent, SignState>{
	SignBloc() : super(SignUpInvalidState()){
		on<SignUpEvent>((event, emit) async{
			int? httpStatusCode = await RestServer.helper.insertNewUser(event.username, event.email, event.password);
      if(httpStatusCode == 200){
        emit(SignUpValidState());
      }
      else if(httpStatusCode == 400 || httpStatusCode == null){
        emit(SignUpInvalidState());
      }
		});
	}
}