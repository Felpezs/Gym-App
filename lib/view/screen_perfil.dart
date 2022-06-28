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
                  SizedBox(height: 10),
                ],
              ),
            ),
            MyCustomForm(BlocProvider.of<UserInfoBloc>(context).userModel)
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(widget.user.altura);
    return Column(
      children: [
        /*MyTextFormField(
            initialValue: user!.username,
            hintText: "seu nome de usuário", 
            labelText: "Nome de Usuário",
            icon: Icons.person, 
            validator: (text) => validateUsername(text),
            onChanged: (text) => user!.username = text
          ),*/
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
        /*
        const Text(
          "Peso",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Slider(
          value: user!.peso!,
          max: 220,
          divisions: 200,
          label: ( "${user!.peso} kg"),
          onChanged: (double value) {
              user!.peso = value;
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
                      groupValue: user!.genero,
                      onChanged: (value) {
                        user!.genero = value.toString();
                      }),
                ),
              ),
              SizedBox(
                width: 180,
                child: ListTile(
                  title: const Text("Feminino"),
                  leading: Radio(
                      value: "Feminino",
                      groupValue: user!.genero,
                      onChanged: (value) {
                          user!.genero = value.toString();
                      }),
                ),
              ),
            ],
          ),
        ),
    */
    const SizedBox(height: 30),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ButtonWidget(
                  buttonText: "Confirmar",
                  width: 100,
                  onpressed: () {
                    print(_formKey.currentState);
                    /*BlocProvider.of<UserInfoBloc>(context).add(
                      UpdateInfo(userModel: UserModel())
                    );*/
                  }),
            )]);
  }
  
}