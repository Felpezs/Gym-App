import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_bloc.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_event.dart';
import 'package:prog_mobile/bloc/bloc_user_info/user_info_state.dart';
import 'package:prog_mobile/model/user_model.dart';
import '../src/validators.dart';
import '../widgets/appBar.dart';
import '../widgets/buttons/button.dart';
import '../widgets/drawer.dart';
import '../widgets/inputs/userData.dart';

class ScreenPerfil extends StatelessWidget {
  ScreenPerfil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<UserInfoBloc>(context)..add(GetInfo()),
      child: Scaffold(
        appBar: MyAppBar(context, title: "Editar Perfil"),
        drawer: const MyDrawer(),
        body: Align(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: Column(
                children: const [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Nos Conte Sobre Você :)",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Atualize ou corrija alguma informação sua:",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: ((context, state) {
                if(state is PersonalInfo){
                  return Expanded(child: MyCustomForm(state.userModel));
                }
                return Text('Carregando');
              }),
            )
          ],
        ),
        ),
        ),
    ); 
  }
}

class MyCustomForm extends StatefulWidget{
  UserModel user;
  MyCustomForm(this.user, {Key? key}) : super(key: key);
  State<MyCustomForm> createState() => _MyCustomFormState();
  
}

class _MyCustomFormState extends State<MyCustomForm>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFormField(
            initialValue: widget.user.username,
            hintText: "seu nome de usuário", 
            labelText: "Nome de Usuário",
            icon: Icons.person, 
            validator: (text) => validateUsername(text),
            onChanged: (text) => widget.user.username = text
          ),
        const Text(
          "Altura",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: widget.user.altura!,
          max: 220,
          divisions: 200,
          label: ("${widget.user.altura} cm"),
          onChanged: (double value) {
            setState(() {
              widget.user.altura = value;
            }); 
          },
        ),
        
        const Text(
          "Peso",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: widget.user.peso!,
          max: 220,
          divisions: 200,
          label: ( "${widget.user.peso} kg"),
          onChanged: (double value) {
            setState(() {
              widget.user.peso = value;
            });  
          },
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                child: ListTile(
                  title: const Text("Masculino"),
                  leading: Radio(
                      value: "Masculino",
                      groupValue: widget.user.genero,
                      onChanged: (value) {
                        setState(() {
                          widget.user.genero = value.toString();
                        }); 
                      }),
                ),
              ),
              SizedBox(
                width: 180,
                child: ListTile(
                  title: const Text("Feminino"),
                  leading: Radio(
                      value: "Feminino",
                      groupValue: widget.user.genero,
                      onChanged: (value) {
                        setState(() {
                          widget.user.genero = value.toString();
                        }); 
                      }),
                ),
              ),
            ],
          ),
        ),
    const SizedBox(height: 40),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonWidget(
                  buttonText: "Confirmar",
                  width: 100,
                  onpressed: () {
                    UserModel updatedUser = UserModel.withData(
                      username: widget.user.username, 
                      altura: widget.user.altura, 
                      peso: widget.user.peso, 
                      genero: widget.user.genero
                    );
                    BlocProvider.of<UserInfoBloc>(context).add(
                      UpdateInfo(userModel: updatedUser)
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Dados atualizados"), 
                        backgroundColor: Colors.green, 
                        duration: Duration(seconds: 1)
                        )
                    );
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/treinos");
                  }),
            )]);
  }
  
}