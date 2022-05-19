import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_event.dart';
import 'package:prog_mobile/src/validators.dart';
import '../../bloc/bloc_login/auth_state.dart';
import '../../widgets/buttons/button.dart';
import '../../widgets/inputs/userData.dart';

class ScreenLogin extends StatelessWidget{
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginView()
    );
  }
}

class LoginView extends StatelessWidget{
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  
  @override 
  Widget build(BuildContext context){
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => {
        if(state is Authenticated){
          Navigator.pushReplacementNamed(context, "/treinos"),
        }
        else if(state is AuthError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message), 
              backgroundColor: Colors.red, 
              duration: const Duration(seconds: 1)
            )
          )
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Align(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/GymAppIcon.png',
                  height: 155,
                  width: 155,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Gym App",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                  ),
                ),
                MyTextFormField(
                  hintText: "seu email", 
                  labelText: "Email", 
                  icon: Icons.email, 
                  onChanged: (text) => email = text,
                  onSaved: (text) => validateEmpty(text),
                ),
                MyTextFormField(
                  hintText: "sua senha", 
                  labelText: "Senha", 
                  obscureText: true, 
                  icon: Icons.lock, 
                  onChanged: (text) => password = text,
                  onSaved: (text) => validateEmpty(text),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(buttonText: 'CADASTRAR', width: 150, onpressed: () {
                        Navigator.pushNamed(context, "/cadastro");
                      }),
                      ButtonWidget(buttonText: 'ENTRAR', width: 150, onpressed: () {
                        BlocProvider.of<AuthBloc>(context).add(SignInEvent(email: email!, password: password!));
                      })
                    ],
                  ),
                )   
              ]
            ),
          ),
        )
      )
      )
    ); 
  }
}