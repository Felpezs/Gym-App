import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_state.dart';

class WrapperLogin extends StatefulWidget{
  const WrapperLogin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WrapperLoginState();
  }
  
}

class WrapperLoginState extends State<WrapperLogin>{

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state){
        if(state is Authenticated){
          Navigator.pushReplacementNamed(context, "/treinos");
        }
        else if(state is AuthError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message), 
              backgroundColor: Colors.red, 
              duration: const Duration(seconds: 1)
            )
          );
        }
        if(state is AuthError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message), 
              backgroundColor: Colors.red, 
              duration: const Duration(seconds: 1)
              )
          );
        }
        else if(state is Unauthenticated){}
        else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Um erro ocorreu :('), 
              backgroundColor: Colors.red, 
              duration: Duration(seconds: 1),
            ));
        }
      }
    );
  }

}