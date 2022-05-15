import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_event.dart';
import 'sign_state.dart';
import '../../server/rest_provider.dart';

class SignBloc extends Bloc<SignEvent, SignState>{
	SignBloc() : super(SignInState()){
		on<SignUpEvent>((event, emit){
			emit(SignUpState());
			RestServer.helper.insertUser(event.usuario);
		});
	}
}