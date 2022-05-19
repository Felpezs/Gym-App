import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_event.dart';
import 'package:prog_mobile/bloc/bloc_login/auth_state.dart';
import 'package:prog_mobile/src/validators.dart';
import '../../widgets/inputs/userData.dart';
import '../../widgets/buttons/button.dart';

class ScreenCadastro extends StatelessWidget {
  const ScreenCadastro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc(),
        child: const CadastroView()
    );
  }
}

class CadastroView extends StatelessWidget{
  const CadastroView({Key? key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context){
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => {
        if(state is AuthError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message), 
              backgroundColor: Colors.red, 
              duration: const Duration(seconds: 1)
              )
          )
        }
        else if(state is Authenticated){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cadastro Feito!'), 
              backgroundColor: Colors.green, 
              duration: Duration(seconds: 1),
            )),
          Navigator.pop(context)
        }
        else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Um erro ocorreu :('), 
              backgroundColor: Colors.red, 
              duration: Duration(seconds: 1),
            )),
        }
      },
      child: Scaffold(
        body: Align(
          child: SingleChildScrollView(
            child: Column(children: [
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
              MyForm(),
              
            ]),
          ),
        ),
      ),
    );
  }
}

class MyForm extends StatelessWidget{
  MyForm({Key? key}) : super(key: key);
  String? username;
  String? passwordCache;
  String? passwordCacheConfirm;
  String? email;
  
  final _formKey = GlobalKey<FormState>();
  @override 
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextFormField(
            hintText: "seu nome de usuário", 
            labelText: "Nome de Usuário",
            icon: Icons.person, 
            validator: (text) => validateUsername(text),
            onChanged: (text) => username = text
          ),
          MyTextFormField(
            hintText: "seu email", 
            labelText: "Email", 
            icon: Icons.email, 
            validator: (text) => validateEmail(text),
            onChanged: (text) => email = text
          ),
          MyTextFormField(
            hintText: "sua senha", 
            labelText: "Senha", 
            obscureText: true, 
            icon: Icons.lock, 
            validator: (text) => validatePassword(passwordCache, passwordCacheConfirm),
            onChanged: (text) => passwordCache = text
          ),
          MyTextFormField(
            hintText: "sua senha", 
            labelText: "Confirmar Senha", 
            obscureText: true, 
            icon: Icons.lock, 
            onSaved: (text) => passwordCacheConfirm = text, 
            validator: (text) => validatePassword(passwordCacheConfirm, passwordCache),
            onChanged: (text) => passwordCacheConfirm = text
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: ButtonWidget(
                buttonText: 'CONFIRMAR CADASTRO',
                width: 150,
                onpressed: () {
                  if(_formKey.currentState!.validate()){
                    BlocProvider.of<AuthBloc>(context).add(SignUpEvent(username: username!, email: email!, password: passwordCacheConfirm!));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cadastro Inválido!'), backgroundColor: Colors.red, duration: Duration(seconds: 1),)
                    );
                  }      
              })
           ),
          )
        ]
      )
    );
  }
}