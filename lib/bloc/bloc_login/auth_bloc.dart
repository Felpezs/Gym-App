import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../server/data_provider.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{
  final FirebaseAuthenticationService _authenticationService = FirebaseAuthenticationService();
	AuthBloc() : super(Unauthenticated()){

    _authenticationService.user.listen((event) {
      add(AuthServerEvent(event));
    });

		on<SignUpEvent>((event, emit) async{
      try{
        await _authenticationService.createUserWithEmailAndPassword(event.email, event.password);
      }
			on FirebaseAuthException catch (e){
        emit(AuthError(message: "O cadastro não pôde ser realizado: ${e.code}"));
      }
		});

    on<SignInEvent>((event, emit) async{
      try{
        await _authenticationService.signInWithEmailAndPassword(event.email, event.password);
      }
      catch (e){
        emit(AuthError(message: "O login não pode ser realizado. Verifique se o email e a senha estão corretos."));
      }
    });

    on<AuthServerEvent>((event, emit) {
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated(userModel: event.userModel!));
      }
    });
	}
}