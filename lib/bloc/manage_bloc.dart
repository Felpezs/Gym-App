import 'package:flutter_bloc/flutter_bloc.dart';
import 'manage_event.dart';
import 'manage_state.dart';
import '../server/rest_provider.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState>{
	ManageBloc() : super(SignInState()){
		on<SignUpEvent>((event, emit){
			emit(SignUpState());
			RestServer.helper.insertUser(event.usuario);
		});
	}
}