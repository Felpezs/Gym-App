import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/sign_bloc.dart';
import 'package:prog_mobile/bloc/bloc_login/sign_event.dart';
import 'package:prog_mobile/model/usuario.dart';
import '../../widgets/inputs/userData.dart';
import '../../widgets/buttons/button.dart';

class ScreenCadastro extends StatelessWidget {
  const ScreenCadastro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SignBloc(),
        child: const CadastroView()
    );
  }
}

class CadastroView extends StatelessWidget{
  const CadastroView({Key? key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
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
    );
  }
}

class MyForm extends StatelessWidget{
  MyForm({Key? key}) : super(key: key);
  String? username;
  String? passwordCache;
  String? passwordCacheConfirm;
  
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
            obscureText: false, icon: Icons.person, 
            validator: (text){
              if(text == null || text.isEmpty) {
                return "Esse campo deve ser preenchido para prosseguir";
              }
              if(text.length < 5){
                return "Esse campo deve ter mais de 5 caracteres (Tem: ${text.length})";
              }
              return null;
            },
            onChanged: (text) => username = text
          ),
          MyTextFormField(
            hintText: "sua senha", 
            labelText: "Senha", 
            obscureText: false, 
            icon: Icons.lock, 
            validator: (text){
              if(text == null || text.isEmpty) {
                return "Esse campo deve ser preenchido para prosseguir";
              }
              if(text.length < 6){
                return "Esse campo deve ter mais de 6 caracteres (Tem: ${text.length})";
              }
              if(passwordCache != passwordCacheConfirm){
                return "As senhas não coincidem";
              }
              return null;
            },
            onChanged: (text) => passwordCache = text
          ),
          MyTextFormField(
            hintText: "sua senha", 
            labelText: "Confirmar Senha", 
            obscureText: false, 
            icon: Icons.lock, 
            onSaved: (text) => passwordCacheConfirm = text, 
            validator: (text){
            if(text == null || text.isEmpty){
              return "Esse campo deve ser preenchido para prosseguir";
            }
            if(passwordCacheConfirm != passwordCache){
              return "As senhas não coincidem";
            }
            if(text.length < 6){
                return "Esse campo deve ter mais de 6 caracteres (Tem: ${text.length})";
              }
            return null;
          },
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
                          Usuario usuario = Usuario(username: username, password: passwordCacheConfirm);
                          BlocProvider.of<SignBloc>(context).add(SignUpEvent(usuario: usuario));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cadastro Feito!'), backgroundColor: Colors.green, duration: Duration(seconds: 1),)
                          );
                          Navigator.pop(context);
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cadastro Inválido'), backgroundColor: Colors.red, duration: Duration(seconds: 1),)
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